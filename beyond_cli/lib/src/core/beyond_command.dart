import 'dart:async';
import 'dart:io';

import 'package:beyond_cli/src/core/server_command.dart';
import 'package:beyond_cli/src/core/version.dart';
import 'package:beyond_cli/src/utils/stdout_util.dart';

import '../common/draw_progress_bar.dart';

class BeyondCommand {
  static final progressStreamController = StreamController<double>.broadcast();
  static final progress = progressStreamController.stream.asBroadcastStream();

  static Future<void> createProject(String projectName) async {
    listenProgress();
    progressStreamController.add(0);
    final currentDirectory = Directory.current.path;
    final projectDirectory = '$currentDirectory/$projectName';

    await createDirectory(
      currentDirectory: currentDirectory,
      projectName: projectName,
    ).then(
      (ProcessResult result) async {
        progressStreamController.add(25);
        await initializeServer(projectDirectory);
        progressStreamController.add(50);
        await initializeClient(projectDirectory);
        progressStreamController.add(75);
        await initializeShared(projectDirectory);
        progressStreamController.add(100);
      },
    );

    await Future.delayed(
      Duration(milliseconds: 50),
    ).whenComplete(() async {
      stdout.write('\n');
      stdout.writeln('Cleaning shared directory');
      await cleanShared(projectDirectory);
      stdout.writeln('All proccess done !');
      progressStreamController.close();
    });
  }

  static Future<ProcessResult> createDirectory({
    required String projectName,
    required String currentDirectory,
  }) async {
    return Process.run(
      'mkdir',
      [projectName],
      runInShell: false,
      workingDirectory: currentDirectory,
    );
  }

  static Future<void> initializeServer(String directory) async {
    await ServerCommand.initializeTemplate(directory);
  }

  static Future<ProcessResult> initializeClient(String directory) async {
    /// Create server client (Web)
    return Process.run(
      'dart',
      ['create', '-t', 'web', 'client'],
      workingDirectory: directory,
    );
  }

  static Future<ProcessResult> initializeShared(String directory) async {
    /// Create shared directory between client & server
    return Process.run(
      'dart',
      ['create', '-t', 'package', 'shared', '--[no-]pub'],
      workingDirectory: directory,
    );
  }

  static Future<ProcessResult> cleanShared(String directory) async {
    /// Clean shared directory
    return Process.run(
      'rm',
      ['-r', 'example'],
      workingDirectory: '$directory/shared',
    );
  }

  static Future<int> validateCommand(List<String> args) async {
    switch (args[0]) {
      case '--version':
        return await printVersion();
      case '-h':
        return await printGlobalHelp();
      case 'help':
        return await printGlobalHelp();
      case 'create':
        return await runCreateCommand(args);
      default:
        return 2;
    }
  }

  static Future<int> runCreateCommand(List<String> args) async {
    if (args.length > 1) {
      if (args[1] == '-h') {
        return printCreateHelp();
      } else {
        await createProject(args[1]);
        return 0;
      }
    } else {
      return 2;
    }
  }

  static Future<int> printCreateHelp() {
    stdout.writeln('Create a new Beyond project');
    stdout.writeln('Usage: dart create <projectname>');
    stdout.writeln('Run "beyond help" to see global options');
    return Future.value(0);
  }

  static Future<int> printGlobalHelp() {
    stdout.writeln(
      'Beyond is a command-line utility for fullstack dart project\n',
    );
    stdout.writeln('Usage: dart <command> [arguments]');
    stdout.writeln('Global options :');
    stdout.writeln('-h, help            Print this usage information');
    stdout.writeln('-v, version         Print the beyond version\n');
    stdout.writeln('Available commands :');
    stdout.writeln('  create            Create Beyond project');
    return Future.value(0);
  }

  static Future<int> printVersion() {
    stdout.writeln(
      StdoutUtil.printColor(
        'Beyond CLI version: $currentVersion',
      ),
    );
    return Future.value(0);
  }

  static void listenProgress() {
    stdout.writeln(
      StdoutUtil.printColor(
        'Initializing project, sometimes takes a while please wait',
      ),
    );
    stdout.writeln(
      StdoutUtil.printColor(
        'Make sure internet is on',
      ),
    );
    progress.listen((progress) {
      drawProgressBar(progress / 100.0, 50);
    });
  }
}
