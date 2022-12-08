class MainSample {
  static String get content => '''
import 'package:beyond/beyond.dart';
import 'package:get_it/get_it.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

import '../lib/src/app/api.dart';
import '../lib/src/app/http.dart';
import '../lib/src/utils/custom_error_handler.dart';
import '../lib/src/utils/database_util.dart';

void main(List<String> args) async {
  // Initialize global variables
  final getIt = GetIt.instance;
  final env = await EnvUtil.readEnv();
  final database = DatabaseUtil();
  final errorHandler = CustomErrorHandler();

  getIt.registerSingleton<Env>(env);
  getIt.registerSingleton<CustomErrorHandler>(errorHandler);
  database.openConnection();

  final api = Api();
  final http = Http(
    [logRequests()],
    api,
  );

  final server = await serve(
    http.handler,
    env.ip,
    env.port,
    poweredByHeader: 'Beyond dart',
  );

  print('Server listening on port \${server.port}');
}
''';
}
