import 'dart:io';

class DirectoryUtil {
  void createDirectories(List<Directory> directories) {
    for (final element in directories) {
      element.createSync(recursive: true);
    }
  }

  static void createFile(
    File file,
    String content,
  ) {
    /// Create the file
    file.createSync(recursive: true);

    /// Write the code to it
    file.writeAsStringSync(content);
  }
}
