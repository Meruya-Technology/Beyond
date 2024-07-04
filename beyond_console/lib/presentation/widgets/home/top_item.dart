import 'package:beyond_console/common/extensions/context_extension.dart';
import 'package:beyond_console/common/extensions/nullable_int_extension.dart';
import 'package:flutter/material.dart';

import '../../../common/const/dimensions.dart';
import '../../../domain/item.dart';
import '../composables/progress_bar.dart';

class TopItem extends StatelessWidget {
  final List<Item> items;

  const TopItem({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(
          Dimensions.m,
        ),
        child: Theme(
          data: context.theme.copyWith(
            dividerColor: context.colorScheme.onBackground.withOpacity(0.05),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(context),
              const SizedBox(height: Dimensions.m),
              table(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top items',
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: Dimensions.xxs,
            ),
            Text(
              'Total xxxxx sales',
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('View All'),
          style: context.theme.elevatedButtonTheme.style,
        ),
      ],
    );
  }

  Widget table(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: DataTable(
        dividerThickness: 0,
        columns: columns(context),
        rows: rows(context),
      ),
    );
  }

  List<DataColumn> columns(BuildContext context) {
    return <DataColumn>[
      DataColumn(
        label: Expanded(
          child: Text(
            'Item',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
      DataColumn(
        label: Expanded(
          child: Text(
            'Category',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
      DataColumn(
        label: Expanded(
          child: Text(
            'Net worth',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
      DataColumn(
        label: Expanded(
          child: Text(
            'Quantity',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    ];
  }

  List<DataRow> rows(BuildContext context) {
    return items
        .map(
          (item) => DataRow(
            cells: <DataCell>[
              DataCell(
                Text(
                  item.name,
                ),
              ),
              DataCell(
                Text(
                  item.category,
                ),
              ),
              DataCell(
                Text(
                  item.totalSales.thousandFormat,
                ),
              ),
              DataCell(
                Row(
                  children: [
                    Expanded(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: 100,
                          maxWidth: 150,
                        ),
                        child: ProgressBar(
                          percentage: (item.stock / item.sold) * 100,
                          fillColor: context.colorScheme.primary,
                          emptyColor:
                              context.colorScheme.primary.withOpacity(0.05),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: Dimensions.xs,
                    ),
                    Text('${(item.stock / item.sold) * 100}%')
                  ],
                ),
              ),
            ],
          ),
        )
        .toList();
  }
}
