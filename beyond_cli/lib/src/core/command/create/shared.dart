import 'dart:io';

class Shared {
  static Future<void> project(String directory) async {
    await initializeShared(directory);
    await cleanShared(directory);
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
}
