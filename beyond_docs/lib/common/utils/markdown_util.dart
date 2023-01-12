import 'package:flutter/services.dart';

import '../consts/paths.dart';

class MarkdownUtil {
  static Future<String> retrieveMarkdown(String fileName) async {
    var markdownString = await rootBundle.loadString(
      '${Paths.baseMarkdownPath}/$fileName.md',
    );
    return markdownString;
  }
}
