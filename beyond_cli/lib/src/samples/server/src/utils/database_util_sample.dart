class DatabaseUtilSample {
  static String get content => '''
import 'dart:io';

import 'postgresql.dart';

class DatabaseUtil {
  Future<void> openConnection() async {
    final database = Postgresql.credential;
    await database.open().then(
      (value) {
        stdout.writeln('Database connection successfully open');
      },
    );
  }
}
''';
}
