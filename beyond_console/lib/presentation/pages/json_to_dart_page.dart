import 'package:beyond_console/presentation/providers/json_to_dart_provider.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/const/dimensions.dart';

class JsonToDartPage extends ConsumerWidget {
  static const routeName = '/json-to-dart';

  const JsonToDartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(jsonToDartProvider);
    return SingleChildScrollView(
      child: buildBody(context, provider),
    );
  }

  Widget buildBody(BuildContext context, JsonToDartProvider provider) {
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
        ],
      ),
    );
  }
}
