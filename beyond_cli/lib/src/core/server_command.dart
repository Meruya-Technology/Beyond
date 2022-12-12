import 'package:args/args.dart';
import 'package:beyond_cli/src/core/server/server_create.dart';
import 'package:beyond_cli/src/core/server/server_generate.dart';

class ServerCommand {
  static Future<void> createProject(String directory) async {
    await ServerCreate.project(directory);
  }

  static Future<int> generate(List<String> args) async {
    var parser = ArgParser();
    parser.addOption('path', defaultsTo: null);
    final parsedArgs = parser.parse(args);

    /// Declare default value for path
    final path = parsedArgs['path'];

    if (args.length < 2) return 2;
    switch (args[1]) {
      case 'model':
        return ServerGenerate.model(
          args.length > 2 ? args[2] : null,
          path,
        );
      default:
        return 2;
    }
  }
}
