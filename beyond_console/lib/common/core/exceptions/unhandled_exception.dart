import 'package:beyond_console/common/core/custom_error.dart';

class UnhandledException implements CustomError {
  final String title;
  final String message;

  UnhandledException({
    this.message = 'Unhandled Exception',
    this.title = "This error does not handled.",
  });

  @override
  StackTrace? get stackTrace => throw UnimplementedError();
}
