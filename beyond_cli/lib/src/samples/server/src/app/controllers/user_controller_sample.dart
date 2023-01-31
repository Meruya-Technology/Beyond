class UserControllerSample {
  static String get content => '''
import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:shelf/shelf.dart';

import '../../utils/custom_error_handler.dart';
import '../models/user.dart';
import '../usecases/create_user.dart';
import '../usecases/delete_user.dart';
import '../usecases/update_user.dart';
import '../usecases/retrieve_user.dart';

/// This is a controller for handlers that segregated from router and http
/// handlers file

class UserController {
  static final _errorHandler = GetIt.instance<CustomErrorHandler>();

  static Future<Response> getUser(Request req) async {
    final useCase = RetrieveUser(
      errorHandler: _errorHandler,
    );

    return await useCase.execute(req);
  }

  static Future<Response> createUser(Request req) async {
    final useCase = CreateUser(
      errorHandler: _errorHandler,
    );

    return await useCase.execute(req);
  }

  static Future<Response> deleteUser(Request req, String id) async {
    final useCase = DeleteUser(
      errorHandler: _errorHandler,
    );

    return await useCase.execute(int.tryParse(id));
  }

  static Future<Response> updateUser(Request req, String id) async {
    final useCase = UpdateUser(
      errorHandler: _errorHandler,
    );
    final requestBody = jsonDecode(
      await req.readAsString(),
    );
    final recordId = int.tryParse(id);
    final request = User.fromJson(requestBody).copyWith(
      id: recordId,
    );

    return await useCase.execute(request);
  }
}
''';
}
