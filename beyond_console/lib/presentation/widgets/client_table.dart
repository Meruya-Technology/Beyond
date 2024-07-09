import 'package:beyond_console/common/extensions/context_extension.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../../common/const/dimensions.dart';

class ClientTable extends StatelessWidget {
  const ClientTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return buildTable(context);
  }

  Widget buildTable(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(
          Dimensions.m,
        ),
        child: Theme(
          data: context.theme.copyWith(
            dividerColor: context.colorScheme.onSurface.withOpacity(0.05),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(context),
              const SizedBox(height: Dimensions.m),
              // FutureBuilder<List<String>?>(
              //   future: socketServers,
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              buildSuccesTable(context),
              //     } else {
              //       return buildLoader(context);
              //     }
              //   },
              // )
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
              'Devices',
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: Dimensions.xxs,
            ),
            Text(
              'x connected',
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),
        ElevatedButton.icon(
          onPressed: () {},
          style: context.theme.elevatedButtonTheme.style,
          label: const Text('Add Device'),
          icon: const Icon(
            FeatherIcons.plus,
            size: 16,
          ),
        ),
      ],
    );
  }

  Widget buildLoader(BuildContext context) {
    return const SizedBox(
      height: 300,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget buildSuccesTable(BuildContext context) {
    return table(context);
  }

  Widget table(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: DataTable(
        dividerThickness: 0,
        columns: columns(context),
        rows: [],
      ),
    );
  }

  List<DataColumn> columns(BuildContext context) {
    return <DataColumn>[
      DataColumn(
        label: Expanded(
          child: Text(
            'Device',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
      DataColumn(
        label: Expanded(
          child: Text(
            'OS Version',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
      DataColumn(
        label: Expanded(
          child: Text(
            'Brand',
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
    ];
  }
}
