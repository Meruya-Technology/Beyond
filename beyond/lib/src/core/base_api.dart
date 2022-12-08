import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'base_messages.dart';
import 'base_response.dart';

abstract class BaseApi {
  Router get baseRouter {
    return Router(
      notFoundHandler: notFoundHandler,
    );
  }

  Future<Response> notFoundHandler(Request request) async {
    final response = BaseResponse(
      message: serviceNotFound,
    );
    return Response.notFound(
      response.toJson(),
    );
  }
}
