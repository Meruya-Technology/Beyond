import 'dart:io';

class Help {
  static Future<int> create() {
    stdout.writeln('Create a new Beyond project');
    stdout.writeln('Usage: dart create <projectname>');
    stdout.writeln('Run "beyond help" to see global options');
    return Future.value(0);
  }

  static Future<int> global() {
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
}
