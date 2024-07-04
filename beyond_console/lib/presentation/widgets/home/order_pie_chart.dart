import 'package:beyond_console/common/const/dimensions.dart';
import 'package:beyond_console/common/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/order.dart';
import '../composables/pie_chart.dart';
import 'order_pie_chart_legend_tile.dart';

class OrderPieChart extends StatelessWidget {
  final List<Order> projects;
  const OrderPieChart({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 300,
          maxWidth: 400,
        ),
        padding: const EdgeInsets.all(
          Dimensions.l,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order Statistics',
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'January - December 2024',
                  style: context.textTheme.titleSmall,
                ),
              ],
            ),
            const SizedBox(
              height: Dimensions.l,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '25000',
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Total Order',
                      style: context.textTheme.titleSmall,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    Dimensions.xs,
                  ),
                  child: PieChart(
                    data: List<PieChartData>.from(
                      projects.map(
                        (project) => PieChartData(
                          project.color,
                          project.percentage,
                        ),
                      ),
                    ),
                    radius: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '5',
                          style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Categories',
                          style: context.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: Dimensions.l,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: projects.length,
              itemBuilder: (context, index) => OrderPieChartLegendTile(
                project: projects[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: Dimensions.m,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
