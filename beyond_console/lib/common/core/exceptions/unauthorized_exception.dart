import 'package:beyond_console/common/core/custom_error.dart';

class UnauthorizedException implements CustomError {
  final String title;
  final String message;

  UnauthorizedException({
    this.message = 'Unauthorized',
    this.title = "Invalid authentication credentials.",
  });

  @override
  StackTrace? get stackTrace => throw UnimplementedError();
}
