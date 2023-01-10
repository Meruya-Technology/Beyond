import 'package:beyond_docs/common/utils/route_util.dart';
import 'package:beyond_docs/presentation/providers/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(globalProvider);
    return MaterialApp(
      title: 'Beyond Documentation',
      themeMode: provider.themeMode,
      theme: provider.themeUtil.lightTheme,
      darkTheme: provider.themeUtil.darkTheme,
      initialRoute: RouteUtil.initialRoute,
      routes: RouteUtil.routes,
    );
  }
}
