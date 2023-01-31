class UpdateUserSample {
  static String get content => '''
import 'package:beyond/beyond.dart';
import 'package:shelf/shelf.dart';

import '../../utils/postgresql.dart';
import '../models/user.dart';

class UpdateUser extends UseCase<User, Response> {
  final ErrorHandler errorHandler;

  UpdateUser({
    required this.errorHandler,
  });

  final database = Postgresql.credential;

  @override
  Future<Response> build(User data) async {
    final result = await DB<User>(model: data).update(
      [
        Condition(
          field: 'id',
          value: data.id,
        ),
      ],
    );

    return JsonResponse(
      200,
      body: {
        'message': 'Update success',
        'result': result,
      },
    );
  }

  @override
  Future<Response> handleError(error) async => errorHandler.formatError(error);
}

''';
}
