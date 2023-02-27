import 'dart:convert';
import 'dart:io';

class EnvUtil {
  static String get env => '.env';

  /// This method will read from .env that located on the server/ root directory
  static Future<Map<dynamic, dynamic>> readEnv() async {
    final separator = (Platform.isWindows) ? r'\' : '/';
    final mainPath = Platform.script.toFilePath(
      windows: Platform.isWindows,
    );
    final paths = mainPath.split(separator);
    final excludedPaths = paths.getRange(0, paths.length - 2);
    final projectPath = excludedPaths.join(separator);
    final envPath = '$projectPath$separator$env';

    /// First read the file string
    final contents = await File(envPath).readAsString();
    final ls = LineSplitter();

    /// Then split by line and sanitize if there is any abstract line of code
    /// that doesnt using key = value format
    final configs = ls.convert(contents);
    final sanitizedConfigs = configs.where(
      (config) => config.contains('='),
    );

    /// Then construct from list of string into map, then into Env class
    final result = {};
    for (var c in sanitizedConfigs) {
      final separatorIndex = c.indexOf("=");
      final newC = [
        c.substring(0, separatorIndex).trim(),
        c.substring(separatorIndex + 1).trim()
      ];
      result[newC.first] = newC.last;
    }
    return result;
  }
}
