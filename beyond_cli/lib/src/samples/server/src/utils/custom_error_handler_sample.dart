class CustomErrorHandlerSample {
  static String get content => '''
import 'package:beyond/beyond.dart';
import 'package:shelf/shelf.dart';

class CustomErrorHandler implements ErrorHandler {
  @override
  Future<Response> formatError(dynamic error) async {
    return Response(
      500,
      body: BaseMessages.internalServerError,
    );
  }
}
''';
}
