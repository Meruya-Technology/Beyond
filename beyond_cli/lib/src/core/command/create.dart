import 'dart:async';
import 'dart:io';

import 'package:beyond_cli/src/core/command/create/client.dart';

import '../../utils/stdout_util.dart';
import 'create/server.dart';
import 'create/shared.dart';
import 'help.dart';

class Create {
  static final progressStreamController = StreamController<double>.broadcast();
  static final progress = progressStreamController.stream.asBroadcastStream();

  static Future<int> dispatch(List<String> args) async {
    if (args.length > 1) {
      if (args[1] == '-h' || args[1] == 'help') {
        return Help.create();
      } else {
        await Create.project(args[1]);
        return 0;
      }
    } else {
      return 2;
    }
  }

  static Future<void> project(String projectName) async {
    listenProgress();
    progressStreamController.add(0);
    final currentDirectory = Directory.current.path;
    final projectDirectory = '$currentDirectory/$projectName';

    await Create.directory(
      currentDirectory: currentDirectory,
      projectName: projectName,
    ).then(
      (ProcessResult result) async {
        progressStreamController.add(25);
        await Shared.project(projectDirectory);
        progressStreamController.add(50);
        await Client.project(projectDirectory);
        progressStreamController.add(75);
        await Server.project(projectDirectory);
        progressStreamController.add(100);
      },
    );

    await Future.delayed(
      Duration(milliseconds: 50),
    ).whenComplete(() async {
      progressStreamController.close();
    });
  }

  static Future<ProcessResult> directory({
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

  static void listenProgress() {
    stdout.writeln(
      StdoutUtil.printColor(
        'Initializing project, sometimes takes a while please wait\n'
        'Make sure internet is on',
      ),
    );
    progress.listen((progress) {
      StdoutUtil.drawProgressBar(progress / 100.0, 50);
    });
  }
}
