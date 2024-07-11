import 'package:beyond_console/common/const/dimensions.dart';
import 'package:beyond_console/common/extensions/context_extension.dart';
import 'package:beyond_console/presentation/providers/connect_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectPage extends ConsumerWidget {
  static const routeName = '/connect';

  const ConnectPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(connectProvider);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: buildBody(
            context,
            provider,
          ),
        );
      },
    );
  }

  Widget buildBody(
    BuildContext context,
    ConnectProvider provider,
  ) {
    return Center(
      child: FutureBuilder<String?>(
        future: provider.serverIp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Room ID',
                      style: context.textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: Dimensions.xxs,
                    ),
                    TextFormField(
                      controller: provider.roomIdController,
                      decoration: InputDecoration(
                        filled: true,
                        suffixIcon: ValueListenableBuilder<TextEditingValue>(
                          valueListenable: provider.roomIdController,
                          builder: (context, value, child) {
                            return IconButton(
                              visualDensity: VisualDensity.compact,
                              onPressed: (value.text.isNotEmpty)
                                  ? () {
                                      provider.saveRoomId(context);
                                    }
                                  : null,
                              icon: Icon(
                                Icons.arrow_circle_right,
                                color: (value.text.isNotEmpty)
                                    ? context.colorScheme.primary
                                    : null,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: Dimensions.xxs,
                    ),
                    Text(
                      'No space, for symbol only -._ allowed',
                      style: context.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
