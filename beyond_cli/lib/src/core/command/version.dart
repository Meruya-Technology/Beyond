import 'dart:io';

import '../../utils/stdout_util.dart';

class Version {
  static const currentVersion = '1.0.0';

  static Future<int> print() {
    stdout.writeln(
      StdoutUtil.printColor(
        'Beyond CLI version: $currentVersion',
      ),
    );
    return Future.value(0);
  }
}
