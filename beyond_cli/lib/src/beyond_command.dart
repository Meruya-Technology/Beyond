import 'dart:async';
import 'dart:io';

class BeyondCommand {
  static final progressStreamController = StreamController<double>.broadcast();
  static final progress = progressStreamController.stream.asBroadcastStream();

  static createProject(String projectName) async {
    listenProgress();
    progressStreamController.add(0);
    final currentDir = Directory.current.path;

    await createDirectory(
      currentDirectory: currentDir,
      projectName: projectName,
    ).then(
      (ProcessResult result) async {
        final newDirectory = '$currentDir/$projectName';
        progressStreamController.add(25);
        await initializeServer(newDirectory);
        progressStreamController.add(50);
        await initializeClient(newDirectory);
        progressStreamController.add(75);
        await initializeShared(newDirectory);
        progressStreamController.add(100);
      },
    );
    await Future.delayed(
      Duration(
        milliseconds: 50,
      ),
    ).whenComplete(() {
      stdout.write('\n');
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

  static Future<ProcessResult> initializeServer(String directory) async {
    /// Create server package
    return Process.run(
      'dart',
      ['create', '-t', 'server-shelf', 'server'],
      workingDirectory: directory,
    );
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
    /// Create server client (Web)
    return Process.run(
      'dart',
      ['create', '-t', 'package', 'shared'],
      workingDirectory: directory,
    );
  }

  static void listenProgress() {
    stdout.write('\n\x1b[38;5;39mInitializing project, please wait\x1b[0m');
    stdout.writeln('\n\x1b[38;5;39mMake sure internet is on\x1b[0m');
    progress.listen((progress) {
      drawProgressBar(progress / 100.0, 50);
    });
  }

  static void drawProgressBar(double amount, int size) {
    final limit = (size * amount).toInt();
    final chars = String.fromCharCodes(
      List.generate(size, (int index) => (index < limit) ? 0x2593 : 0x2591),
    );
    stdout.write(
      '\r\x1b[38;5;75;51m$chars\x1b[0m',
    );
  }
}
