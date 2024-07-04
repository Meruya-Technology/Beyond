import 'package:beyond_console/common/const/dimensions.dart';
import 'package:beyond_console/common/extensions/context_extension.dart';
import 'package:beyond_console/common/extensions/nullable_int_extension.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/transaction.dart';

class SmallLineChart extends StatelessWidget {
  final List<Transaction> transactions;

  const SmallLineChart({
    super.key,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: Dimensions.m,
      ),
      width: double.maxFinite,
      height: 160,
      child: LineChart(
        mainData(context),
      ),
    );
  }

  LineChartData mainData(BuildContext context) {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (_) => context.colorScheme.primaryContainer,
          tooltipHorizontalAlignment: FLHorizontalAlignment.center,
          tooltipMargin: -10,
          getTooltipItems: (touchedSpots) => touchedSpots.map((barSpot) {
            return LineTooltipItem(
              '${transactions[barSpot.spotIndex].label}\n',
              context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ) ??
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
              children: [
                TextSpan(
                  text: barSpot.y.toInt().currencyFormat,
                  style: context.textTheme.bodyMedium,
                )
              ],
            );
          }).toList(),
        ),
      ),
      gridData: const FlGridData(
        show: false,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
      ),
      titlesData: const FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 30,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            interval: 1,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      lineBarsData: [
        LineChartBarData(
          spots: List<FlSpot>.generate(
            transactions.length,
            (index) => FlSpot(
              index.toDouble(),
              transactions[index].value.toDouble(),
            ),
          ),
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              context.colorScheme.primary,
              context.colorScheme.tertiary,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: false,
          ),
        ),
      ],
    );
  }
}
