import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/component_theme.dart';

class ThemeUtil {
  /// Themes Mode
  /// Note : in this getter color scheme binded manually and not retrieved
  /// from Theme.of(context) because the color scheme is not yet binded to the
  /// build tree. But after the main file using this themes it will be available
  /// to retrieved from Theme.of(context)
  /// ```dart
  /// MaterialApp(
  ///   title: 'Cart It Out',
  ///   themeMode: ThemeMode.light,
  ///   theme: provider.themeUtil.lightTheme,
  ///   darkTheme: provider.themeUtil.darkTheme,
  ///   routes: provider.routeUtil.routes,
  ///   initialRoute: provider.routeUtil.initialRoute,
  /// ),
  /// ```

  ThemeData get lightTheme => ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
        bottomNavigationBarTheme:
            lightComponentTheme.bottomNavigationBarThemeData,
        appBarTheme: lightComponentTheme.appBarTheme,
        inputDecorationTheme: lightComponentTheme.inputDecorationTheme,
        textTheme: lightTextTheme,
        iconTheme: lightComponentTheme.iconThemeData,
        chipTheme: lightComponentTheme.chipThemeData,
        navigationBarTheme: lightComponentTheme.navigationBarThemeData,
        dividerTheme: lightComponentTheme.dividerThemeData,
        elevatedButtonTheme: lightComponentTheme.elevatedButtonThemeData,
        outlinedButtonTheme: lightComponentTheme.outlinedButtonThemeData,
        popupMenuTheme: lightComponentTheme.popupMenuThemeData,
        toggleButtonsTheme: lightComponentTheme.toggleButtonsTheme,
        snackBarTheme: lightComponentTheme.snackBarThemeData,
      );

  ThemeData get darkTheme => ThemeData(
        colorScheme: darkColorScheme,
        scaffoldBackgroundColor: darkColorScheme.background,
        useMaterial3: true,
        bottomNavigationBarTheme:
            darkComponentTheme.bottomNavigationBarThemeData,
        appBarTheme: darkComponentTheme.appBarTheme,
        inputDecorationTheme: darkComponentTheme.inputDecorationTheme,
        textTheme: darkTextTheme,
        iconTheme: darkComponentTheme.iconThemeData,
        chipTheme: darkComponentTheme.chipThemeData,
        dividerTheme: darkComponentTheme.dividerThemeData,
        elevatedButtonTheme: darkComponentTheme.elevatedButtonThemeData,
        outlinedButtonTheme: darkComponentTheme.outlinedButtonThemeData,
        popupMenuTheme: darkComponentTheme.popupMenuThemeData,
        toggleButtonsTheme: darkComponentTheme.toggleButtonsTheme,
        snackBarTheme: darkComponentTheme.snackBarThemeData,
      );

  /// Componen Theme
  ComponentTheme get lightComponentTheme => ComponentTheme(
        colorScheme: lightColorScheme,
      );

  ComponentTheme get darkComponentTheme => ComponentTheme(
        colorScheme: darkColorScheme,
      );

  /// ColorScheme
  ColorScheme get lightColorScheme => ColorScheme.fromSeed(
        seedColor: Colors.greenAccent,
      );

  ColorScheme get darkColorScheme => ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.dark,
      );

  /// Text Theme
  TextTheme get lightTextTheme => GoogleFonts.interTextTheme().apply(
        bodyColor: lightColorScheme.onBackground,
        displayColor: lightColorScheme.onBackground,
        decorationColor: lightColorScheme.onBackground,
      );

  TextTheme get darkTextTheme => GoogleFonts.poppinsTextTheme().apply(
        bodyColor: darkColorScheme.onBackground,
        displayColor: darkColorScheme.onBackground,
        decorationColor: darkColorScheme.onBackground,
      );
}
