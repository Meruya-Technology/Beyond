import '../custom_error.dart';

class ServerException implements CustomError {
  final String title;
  final String message;

  ServerException({
    this.message = 'Internal Server Error',
    this.title = "The server encountered an unexpected condition that "
        "prevented it from fulfilling the request.",
  });

  @override
  StackTrace? get stackTrace => throw UnimplementedError();
}
