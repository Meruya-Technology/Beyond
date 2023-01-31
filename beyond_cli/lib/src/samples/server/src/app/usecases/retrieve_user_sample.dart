class RetrieveUserSample {
  static String get content => '''
import 'package:beyond/beyond.dart';
import 'package:server/src/app/models/user.dart';
import 'package:shelf/shelf.dart';

class RetrieveUser extends UseCase<Request, Response> {
  final ErrorHandler errorHandler;

  RetrieveUser({
    required this.errorHandler,
  });

  @override
  Future<Response> build(Request data) async {
    /// Map json to user entity

    final results = await DB<User>().select(
      conditions: [
        Condition(
          field: 'is_active',
          value: true,
        )
      ],
      orders: [
        OrderBy(
          field: 'created_at',
        )
      ],
    );

    final classResults = results?.map(
      (result) => (result != null) ? User.fromJson(result) : null,
    );

    classResults?.forEach(
      (classResult) {
        print(classResult?.toMap());
      },
    );

    return JsonResponse(
      200,
      body: {
        'message': 'new success',
        'result': results,
      },
    );
  }

  @override
  Future<Response> handleError(error) async => errorHandler.formatError(error);
}
''';
}
