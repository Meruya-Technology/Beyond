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
            return Text(snapshot.data!);
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
