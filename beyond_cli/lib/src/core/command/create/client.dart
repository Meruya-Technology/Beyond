import 'dart:io';

class Client {
  static Future<void> project(String directory) async {
    await initializeClient(directory);
  }

  static Future<ProcessResult> initializeClient(String directory) async {
    /// Create server client (Web)
    return Process.run(
      'dart',
      ['create', '-t', 'web', 'client'],
      workingDirectory: directory,
    );
  }
}
