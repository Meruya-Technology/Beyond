import 'dart:async';
import 'dart:io';

import 'package:beyond_cli/src/core/server_command.dart';

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
    final argumentLength = args.length;
    switch (args[0]) {
      case 'create':
        if (argumentLength > 1) {
          await createProject(args[1]);
          break;
        } else {
          return 2;
        }
      default:
        return 2;
    }
    return 0;
  }

  static void listenProgress() {
    stdout.write('\n\x1b[38;5;39mInitializing project, please wait\x1b[0m');
    stdout.writeln('\n\x1b[38;5;39mMake sure internet is on\x1b[0m');
    progress.listen((progress) {
      drawProgressBar(progress / 100.0, 50);
    });
  }
}
