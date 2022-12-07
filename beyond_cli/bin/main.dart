import 'dart:io';

import 'package:beyond_cli/command_runner.dart';

Future<int> main(List<String> args) async {
  final exitCode = await beyondCommandRunner(args);
  exit(exitCode);
}
