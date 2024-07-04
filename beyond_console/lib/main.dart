import 'package:beyond_console/common/extensions/context_extension.dart';
import 'package:beyond_console/presentation/providers/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_strategy/url_strategy.dart';
import 'common/const/strings.dart';
import 'presentation/facades/main_facade.dart';

Future<void> main() async {
  setPathUrlStrategy();

  await MainFacade.initialize();

  runApp(
    const ProviderScope(
      child: BeyondConsoleApp(),
    ),
  );
}

class BeyondConsoleApp extends ConsumerWidget {
  const BeyondConsoleApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(globalProvider);
    return MaterialApp.router(
      title: Strings.beyondDashboard,
      routerConfig: provider.routeUtil.goRouterConfig,
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        brightness: provider.brightness,
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData(
            brightness: provider.brightness,
          ).textTheme,
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            splashFactory: InkRipple.splashFactory,
            backgroundColor: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.pressed)) {
                  return context.colorScheme.primary.withOpacity(0.5);
                } else if (states.contains(WidgetState.disabled)) {
                  return context.colorScheme.onSurface.withOpacity(0.12);
                } else {
                  return context.colorScheme.primary;
                }
              },
            ),
            foregroundColor: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.pressed)) {
                  return context.colorScheme.onPrimary;
                } else if (states.contains(WidgetState.disabled)) {
                  return context.colorScheme.onSurface.withOpacity(0.38);
                } else {
                  return context.colorScheme.onPrimary;
                }
              },
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.pressed)) {
                  return context.colorScheme.onSurface;
                } else if (states.contains(WidgetState.disabled)) {
                  return context.colorScheme.onSurface.withOpacity(0.38);
                } else {
                  return context.colorScheme.onSurface;
                }
              },
            ),
            side: WidgetStateProperty.resolveWith(
              (states) {
                return BorderSide(
                  color: context.colorScheme.onSurface.withOpacity(0.25),
                  width: 1,
                );
              },
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
