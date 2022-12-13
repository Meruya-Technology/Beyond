import 'dart:io';

class Help {
  static Future<int> create() {
    stdout.writeln(
      'Create a new Beyond project\n'
      'Usage: dart create <projectname>\n'
      'Run "beyond help" to see global options',
    );
    return Future.value(0);
  }

  static Future<int> generate() {
    stdout.writeln(
      'Generate a new Beyond file\n'
      'Usage: dart generate [argument] --path <path to file>\n'
      '-h, help                   Print this usage information\n'
      '    model                  Generate model file\n\n'
      '      [FirstClassName]     Class / file name, use UpperCamelCase. The output file will using snake_case\n'
      '                           meanwhile the ouput file classname will use UpperCamelCase\n\n'
      '-p, --path <path to file>  Path to json file [Required]\n\n'
      'Run "beyond help" to see global options',
    );
    return Future.value(0);
  }

  static Future<int> global() {
    stdout.writeln(
      'Beyond is a command-line utility for fullstack dart project\n\n'
      'Usage: dart <command> [arguments]\n'
      'Global options     :\n'
      '-h, help            Print this usage information\n'
      '-v, version         Print the beyond version\n\n'
      'Available commands :\n'
      '  create            Create Beyond project\n'
      '  generate          Generate beyond file\n',
    );
    return Future.value(0);
  }
}
