import 'dart:io';

import 'package:beyond_cli/src/core/beyond_command.dart';

Future<int> beyondCommandRunner(List<String> args) async {
  int exitCode = await BeyondCommand.dispatchCommand(args);
  await Future.wait<void>([stdout.close(), stderr.close()]);
  return exitCode;
}
