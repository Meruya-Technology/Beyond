import 'dart:io';
import 'package:beyond_cli/src/beyond_command.dart';

Future<int> beyondCommandRunner(List<String> args) async {
  int exitCode = 0;
  if (args.isNotEmpty) {
    final secondCommand = args[0];
    switch (secondCommand) {
      case 'create':

        /// TODO : put some args checker, so the args[1] cannot be empty
        await BeyondCommand.createProject(args[1]);
        break;
      default:
        stdout.writeln('Unknown command');
        break;
    }
  } else {
    stdout.writeln('Print some help');
  }
  return exitCode;
}
