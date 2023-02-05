import 'dart:io';

import '../../utils/stdout_util.dart';

class Version {
  static const currentVersion = '0.0.2';

  static Future<int> print() {
    stdout.writeln(
      StdoutUtil.printColor(
        'Beyond CLI version: $currentVersion',
      ),
    );
    return Future.value(0);
  }
}
