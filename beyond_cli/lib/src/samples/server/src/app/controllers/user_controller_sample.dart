class UserControllerSample {
  static String get content => '''
import 'package:get_it/get_it.dart';
import 'package:shelf/shelf.dart';

import '../../utils/custom_error_handler.dart';
import '../usecases/get_user.dart';

/// This is a controller for handlers that segregated from router and http
/// handlers file

class UserController {
  static final _errorHandler = GetIt.instance<CustomErrorHandler>();

  static Future<Response> getUser(Request req) async {
    final useCase = GetUser(
      errorHandler: _errorHandler,
    );

    return await useCase.execute(req);
  }
}
''';
}
