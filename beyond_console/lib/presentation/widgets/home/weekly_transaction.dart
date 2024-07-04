import 'package:beyond_console/common/extensions/context_extension.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../../../common/const/dimensions.dart';
import '../../../domain/transaction.dart';
import 'small_bar_chart.dart';

class WeeklyTransaction extends StatelessWidget {
  final List<Transaction> transactions;

  const WeeklyTransaction({
    required this.transactions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: Dimensions.xxl,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.l,
                vertical: Dimensions.m,
              ),
              child: SmallBarChart(
                transactions: transactions,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                Dimensions.l,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$250.000',
                        style: context.textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: Dimensions.xs,
                      ),
                      Text(
                        'Weekly Transaction',
                        style: context.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: Dimensions.xxs,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.xs,
                      vertical: Dimensions.xxs,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          FeatherIcons.trendingUp,
                          color: Colors.green,
                          size: 16,
                        ),
                        const SizedBox(
                          width: Dimensions.xxs,
                        ),
                        Text(
                          '20%',
                          style: context.textTheme.bodySmall?.copyWith(
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
