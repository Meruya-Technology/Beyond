import 'dart:io';

import 'package:beyond_cli/beyond_cli.dart';

Future<int> main(List<String> args) async {
  final exitCode = await beyondCli(args);
  exit(exitCode);
}
