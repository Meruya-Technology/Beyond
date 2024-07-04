import 'package:beyond_console/common/extensions/context_extension.dart';
import 'package:beyond_console/common/extensions/nullable_int_extension.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../common/const/dimensions.dart';
import '../../../domain/transaction.dart';

class SmallBarChart extends StatelessWidget {
  final List<Transaction> transactions;

  const SmallBarChart({
    super.key,
    required this.transactions,
  });

  final Duration animDuration = const Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 160,
      padding: const EdgeInsets.only(
        top: Dimensions.m,
      ),
      child: BarChart(
        mainBarData(context),
        swapAnimationDuration: animDuration,
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    required BuildContext context,
    double width = 14,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: context.colorScheme.primary,
          width: width,
          borderSide: const BorderSide(
            color: Colors.white,
            width: 0,
          ),
          backDrawRodData: BackgroundBarChartRodData(
            show: false,
            toY: 20,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups(BuildContext context) =>
      List.generate(7, (i) {
        return makeGroupData(
          i,
          transactions[i].value.toDouble(),
          context: context,
        );
      });

  BarChartData mainBarData(BuildContext context) {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (_) => context.colorScheme.primaryContainer,
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          tooltipMargin: -10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            return BarTooltipItem(
              '${transactions[groupIndex].label}\n',
              context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ) ??
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
              children: <TextSpan>[
                TextSpan(
                  text: rod.toY.toInt().currencyFormat,
                  style: context.textTheme.bodyMedium,
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {},
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(
        context,
      ),
      gridData: const FlGridData(
        show: false,
      ),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: Text(
        transactions[value.toInt()].label.substring(0, 3),
      ),
    );
  }

  Future<dynamic> refreshState() async {}
}
