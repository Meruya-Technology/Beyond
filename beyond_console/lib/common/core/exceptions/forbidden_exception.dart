import '../custom_error.dart';

class ForbiddenException implements CustomError {
  final String title;
  final String message;

  ForbiddenException({
    this.message = 'Forbidden',
    this.title = "Server understands the request but refuses to authorize it.",
  });

  @override
  StackTrace? get stackTrace => throw UnimplementedError();
}
