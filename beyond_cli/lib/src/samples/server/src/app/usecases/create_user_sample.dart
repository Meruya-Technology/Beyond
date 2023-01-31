class CreateUserSample {
  static String get content => '''
import 'dart:convert';

import 'package:beyond/beyond.dart';
import 'package:get_it/get_it.dart';
import 'package:shelf/shelf.dart';

import '../../utils/postgresql.dart';
import '../models/user.dart';

class CreateUser extends UseCase<Request, Response> {
  final ErrorHandler errorHandler;

  CreateUser({
    required this.errorHandler,
  });

  final database = Postgresql.credential;

  static final _env = GetIt.instance<Env>();

  @override
  Future<Response> build(Request data) async {
    final requestBody = jsonDecode(await data.readAsString());
    final user = User.fromJson(requestBody);
    final model = user.copyWith(
      password: EncryptUtil.encrypt(
        user.password!,
        secretKey: _env.secretKey,
      ),
    );
    final result = await DB<User>(model: model).insert();

    return JsonResponse(
      200,
      body: {
        'message': 'new success',
        'result': result,
      },
    );
  }

  @override
  Future<Response> handleError(error) async => errorHandler.formatError(error);
}
''';
}
