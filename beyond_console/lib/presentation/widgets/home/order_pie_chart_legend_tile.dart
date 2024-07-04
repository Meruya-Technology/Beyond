import 'package:beyond_console/common/const/dimensions.dart';
import 'package:beyond_console/common/extensions/context_extension.dart';
import 'package:beyond_console/common/extensions/nullable_int_extension.dart';
import 'package:flutter/material.dart';

import '../../../domain/order.dart';

class OrderPieChartLegendTile extends StatelessWidget {
  final Order project;

  const OrderPieChartLegendTile({
    required this.project,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(
            right: Dimensions.xs,
          ),
          padding: const EdgeInsets.all(
            Dimensions.xs,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: project.color.withOpacity(0.15),
          ),
          child: Icon(
            project.icon,
            color: project.color,
            size: 16,
          ),
        ),
        Expanded(
          child: Text(
            project.name,
            style: context.textTheme.bodyLarge,
          ),
        ),
        Text(
          project.amount.thousandFormat,
        ),
      ],
    );
  }
}
