import 'dart:async';
import 'dart:io';

import 'package:beyond_cli/src/core/command/version.dart';

import '../utils/stdout_util.dart';
import 'command/create.dart';
import 'command/generate.dart';
import 'command/help.dart';

class BeyondCommand {
  static Future<int> dispatchCommand(List<String> args) async {
    switch (args[0]) {
      case '-v':
        return await Version.print();
      case 'version':
        return await Version.print();
      case '-h':
        return await Help.global();
      case 'help':
        return await Help.global();
      case 'create':
        return await Create.dispatch(args);
      case 'generate':
        return await Generate.dispatch(args);
      default:
        stdout.writeln(
          StdoutUtil.printColor(
            'command not supported $args',
            code: '196',
          ),
        );
        return 2;
    }
  }
}
