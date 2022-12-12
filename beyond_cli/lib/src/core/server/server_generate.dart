import 'dart:convert';
import 'dart:io';

import 'package:beyond_cli/src/utils/json_util.dart';
import 'package:beyond_cli/src/utils/stdout_util.dart';

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
    final fileName = path?.split('/').last;
    final newClassName = className ?? fileName!;

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
        final results = jsonUtil.segregateToClass(newClassName, parsedJson);
        for (var result in results) {
          final file = File('$rootDir/${newClassName.toLowerCase()}.dart');
          DirectoryUtil.createFile(
            file,
            jsonEncode(result),
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
