class DeleteUserSample {
  static String get content => '''
import 'package:beyond/beyond.dart';
import 'package:shelf/shelf.dart';

import '../../utils/postgresql.dart';
import '../models/user.dart';

class DeleteUser extends UseCase<int?, Response> {
  final ErrorHandler errorHandler;

  DeleteUser({
    required this.errorHandler,
  });

  final database = Postgresql.credential;

  @override
  Future<Response> build(int? data) async {
    final result = await DB<User>().delete(
      [
        Condition(
          field: 'id',
          value: data,
        ),
      ],
    );

    return JsonResponse(
      200,
      body: {
        'message': 'Delete success',
        'result': result,
      },
    );
  }

  @override
  Future<Response> handleError(error) async => errorHandler.formatError(error);
}

''';
}
