import 'dart:convert';
import 'dart:io';

import 'env.dart';
import 'package:collection/collection.dart';

class EnvUtil {
  static String get currentDirectory => Directory.current.path.toString();
  static String get env => '$currentDirectory/.env';

  /// This method will read from .env that located on the server/ root directory
  static Future<Env> readEnv() async {
    /// First read the file string
    final contents = await File(env).readAsString();
    final ls = LineSplitter();

    /// Then split by line and sanitize if there is any abstract line of code
    final configs = ls.convert(contents);
    final sanitizedConfigs = configs.where(
      (config) => config.contains('='),
    );

    /// Then construct from list of string into map, then into Env class
    final result = {};
    for (var c in sanitizedConfigs) {
      final newC = c.split('=');
      final lastIndex = newC.length - 1;
      result[newC.first] = newC.getRange(1, lastIndex).join();
    }
    return Env.fromJson(result);
  }
}
