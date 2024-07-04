import 'package:beyond_console/common/core/custom_error.dart';

class NotFoundException implements CustomError {
  final String title;
  final String message;

  NotFoundException({
    this.message = 'Bad Request',
    this.title = "server cannot or will not process the request due "
        "to something that is perceived to be a client error "
        "(for example, malformed request syntax, invalid request "
        "message framing, or deceptive request routing).",
  });

  @override
  StackTrace? get stackTrace => throw UnimplementedError();
}
