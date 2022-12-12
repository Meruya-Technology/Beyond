import 'dart:convert';
import 'dart:io';

import 'package:beyond_cli/src/samples/server/src/app/models.dart/model_sample.dart';
import 'package:beyond_cli/src/utils/json_util.dart';
import 'package:beyond_cli/src/utils/stdout_util.dart';
import 'package:beyond_cli/src/utils/text_util.dart';

import '../../utils/directory_util.dart';

class ServerGenerate {
  /// Generate model with json as an input, this method will separate the json
  /// layer per layer. First it will segregate first layer, then it will scan
  /// if there any layer left to segregate, if not it's finish
  static Future<int> model(
    String? className,
    String? path,
  ) async {
    final jsonUtil = JsonUtil();
    final rootDir = Directory.current.path;
    final filePath = '$rootDir/$path';
    final sourceFileName = path?.split('/').last;
    final newClassName = className ?? sourceFileName!;

    /// Exit when path is null, because to generate model we need json input
    if (path == null) {
      stdout.writeln('To create a model, you need to add a json file');
      stdout.writeln('Use beyond server:generate model -h');
      return 2;
    }

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
          final fileName = TextUtil.snakeCase(result['className']);
          final file = File('$rootDir/$fileName.dart');
          final content = ModelSample.buildClassString(result);
          DirectoryUtil.createFile(
            file,
            content,
          );
        }
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
}
