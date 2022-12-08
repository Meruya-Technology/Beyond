class PostgresqlSample {
  static String get content => '''
import 'package:beyond/beyond.dart';
import 'package:get_it/get_it.dart';
import 'package:postgres/postgres.dart';

class Postgresql {
  static final _env = GetIt.instance<Env>();

  static PostgreSQLConnection get credential => PostgreSQLConnection(
        _env.dbHost,
        _env.dbPort,
        _env.dbName,
        username: _env.dbUsername,
        password: _env.dbPassword,
      );
}
''';
}
