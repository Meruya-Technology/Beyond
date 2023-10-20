import 'package:beyond_console/common/const/dimensions.dart';
import 'package:beyond_console/common/extensions/nullable_int_extension.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/home_provider.dart';

class HomePage extends ConsumerWidget {
  static const routeName = '/';

  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(homeProvider);
    return SingleChildScrollView(
      child: buildBody(context, provider),
    );
  }

  Widget buildBody(BuildContext context, HomeProvider provider) {
    return Container(
      padding: const EdgeInsets.all(
        Dimensions.l,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Saldo Deposit : ',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'Rp100.000.000',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 20.0,
                        backgroundImage: NetworkImage(
                          'https://hackernoon.imgix.net/images/bfqrt3x6hAVgXkezEqVTPC5AAFA2-lbc3lp3.jpeg',
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fulan bin fulan',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            'fulan@mail.com',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      IconButton(
                        onPressed: () {},
                        visualDensity: VisualDensity.compact,
                        iconSize: 16,
                        icon: const Icon(
                          FeatherIcons.chevronDown,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Card(
                child: buildCurrentTransaction(context, provider),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCurrentTransaction(BuildContext context, HomeProvider provider) {
    return DataTable(
      columns: <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'No customer',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Nominal',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Status',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Action',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ],
      rows: provider.currentTransactions
          .map(
            (currentTransaction) => DataRow(
              cells: <DataCell>[
                DataCell(
                  Text(
                    currentTransaction.customerNumber,
                  ),
                ),
                DataCell(
                  Text(
                    currentTransaction.nominal.idFormat,
                  ),
                ),
                DataCell(
                  Chip(
                    backgroundColor: currentTransaction.status.color,
                    visualDensity: VisualDensity.compact,
                    label: Text(
                      currentTransaction.status.name,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
                DataCell(
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FeatherIcons.externalLink,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
