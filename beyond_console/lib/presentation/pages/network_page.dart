import 'package:beyond_console/common/formatters/ip_input_formatter.dart';
import 'package:beyond_console/presentation/providers/network_provider.dart';
import 'package:beyond_console/presentation/widgets/client_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_client/web_socket_client.dart';

import '../../common/const/dimensions.dart';
import '../widgets/composables/bread_crumb.dart';

class NetworkPage extends ConsumerWidget {
  static const routeName = '/network';

  const NetworkPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(networkProvider);
    return buildBody(context, provider);
  }

  Widget buildBody(BuildContext context, NetworkProvider provider) {
    return Container(
      padding: const EdgeInsets.all(
        Dimensions.l,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const BreadCrumb(
            title: 'Network Inspector',
            subTitle: 'HTTP requests and responses listener interface',
          ),
          const SizedBox(
            height: Dimensions.m,
          ),
          connectSection(
            context,
            provider,
          ),
          const SizedBox(
            height: Dimensions.m,
          ),
          const ClientTable(),
        ],
      ),
    );
  }

  Widget connectSection(BuildContext context, NetworkProvider provider) {
    return StreamBuilder(
      stream: provider.connectionStatus,
      builder: (context, snapshot) {
        if (snapshot.data is! Connected && snapshot.data is! Reconnected) {
          return Padding(
            padding: const EdgeInsets.only(
              top: Dimensions.m,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: provider.ipAddressController,
                    inputFormatters: [
                      IpInputFormatter(),
                    ],
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Enter Web Socket IP Address',
                      suffix: ValueListenableBuilder<TextEditingValue>(
                        valueListenable: provider.ipAddressController,
                        builder: (context, value, child) => Visibility(
                          visible: (value.text.isNotEmpty),
                          child: IconButton(
                            onPressed: provider.clearIpAddress,
                            visualDensity: VisualDensity.compact,
                            icon: const Icon(
                              Icons.clear,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: Dimensions.m,
                ),
                SizedBox(
                  width: 150,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: 'Port',
                    ),
                  ),
                ),
                const SizedBox(
                  width: Dimensions.m,
                ),
                ElevatedButton(
                  onPressed: () {
                    provider.connectWebSocket();
                  },
                  child: const Text(
                    'Connect to web socket',
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
