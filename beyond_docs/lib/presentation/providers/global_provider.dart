import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/utils/theme_util.dart';

class GlobalProvicer extends ChangeNotifier {
  ThemeUtil get themeUtil => ThemeUtil();
  ThemeMode get themeMode => _themeMode;

  var _themeMode = ThemeMode.light;

  /// Method section
  void siwtchBrightness() {
    _themeMode =
        (themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

final globalProvider = ChangeNotifierProvider<GlobalProvicer>(
  (ref) => GlobalProvicer(),
);
