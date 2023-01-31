class DatabaseUtilSample {
  static String get content => '''
import 'package:postgres/postgres.dart';
import 'postgresql.dart';

class DatabaseUtil {
  Future<PostgreSQLConnection> openConnection() async {
    final database = Postgresql.credential;
    return await database.open().then(
      (_) => database,
      onError: (error) {
        database.close();
        throw Exception('Cannot open database connection');
      },
    );
  }
}
''';
}
