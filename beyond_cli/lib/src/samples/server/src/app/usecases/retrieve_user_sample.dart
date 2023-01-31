class RetrieveUserSample {
  static String get content => '''
import 'package:beyond/beyond.dart';
import 'package:shelf/shelf.dart';

class GetUser extends UseCase {
  final ErrorHandler errorHandler;

  GetUser({
    required this.errorHandler,
  });

  @override
  Future<Response> build(Request req) async {
    return Response(
      200,
      body: 'Success',
    );
  }

  @override
  Future<Response> handleError(error) async => errorHandler.formatError(error);
}
''';
}
