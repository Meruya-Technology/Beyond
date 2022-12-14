import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:beyond_cli/src/core/command/help.dart';
import 'package:beyond_cli/src/samples/server/src/app/models.dart/model_sample.dart';
import 'package:beyond_cli/src/utils/json_util.dart';
import 'package:beyond_cli/src/utils/stdout_util.dart';

import '../../utils/directory_util.dart';
import '../entity/base_class.dart';

class Generate {
  static Future<int> dispatch(List<String> args) async {
    var parser = ArgParser();
    parser.addFlag('help', abbr: 'h', defaultsTo: null);
    parser.addOption('path', defaultsTo: null);
    parser.addOption('prefix', defaultsTo: 'model');
    final parsedArgs = parser.parse(args);

    /// Declare default value for path
    final path = parsedArgs['path'];
    final prefix = parsedArgs['prefix'];

    if (args.length < 2) return Help.generate();
    switch (args[1]) {
      case 'model':
        final withoutClassName = args[2].startsWith('--');
        if (path == null) {
          return Help.generate(
            additionalMessage: 'Path is required --path <path to json file>',
          );
        }
        return Generate.model(
          withoutClassName ? null : args[2],
          path,
          prefix,
        );
      case '-h':
        return Help.generate();
      case 'help':
        return Help.generate();
      default:
        return 2;
    }
  }

  /// Generate model with json as an input, this method will separate the json
  /// layer per layer. First it will segregate first layer, then it will scan
  /// if there any layer left to segregate, if not it's finish
  static Future<int> model(
    String? className,
    String? path,
    String? prefix,
  ) async {
    final jsonUtil = JsonUtil(
      prefix: prefix,
    );
    final rootDir = Directory.current.path;
    final filePath = '$rootDir/$path';
    final sourceFileName = path?.split('/').last;
    final newClassName = className ?? sourceFileName!.split('.')[0];

    return await File(filePath).readAsString().then((String contents) {
      /// First tryParse the json file
      final parsedJson = JsonUtil.tryParse(contents);

      /// If the result is not null, which it means the json is legit then do
      /// the convert task into multiple dart class
      if (parsedJson != null) {
        final results = jsonUtil.segregateToClass(
          newClassName,
          parsedJson,
        );
        stdout.writeln('Generating ${results.length} file');

        /// Segregate json into multiple classes
        for (var result in results) {
          final file = File('$rootDir/${result.fileName}.dart');
          final content = ModelSample.build(result);
          DirectoryUtil.createFile(
            file,
            content,
          );
        }

        writeManifest(rootDir, results);
      }

      return 0;
    }).catchError((error) {
      stdout.writeln(
        StdoutUtil.printColor(
          'Something went wrong when writing dart file \n'
          'stackTrace : ${error.toString()}',
          code: '196',
        ),
      );
      return 2;
    });
  }

  static void writeManifest(String directory, List<BaseClass> files) {
    final manifest = File('$directory/generate_manifest.json');
    DirectoryUtil.createFile(
      manifest,
      jsonEncode(
        files.map((file) => file.manifest).toList(),
      ),
    );
  }
}
