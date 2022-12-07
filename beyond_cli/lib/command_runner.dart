import 'package:beyond_cli/src/core/beyond_command.dart';

Future<int> beyondCommandRunner(List<String> args) async {
  int exitCode = await BeyondCommand.validateCommand(args);
  return exitCode;
}
