import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'base_responses.dart';

abstract class BaseApi {
  Router get baseRouter {
    return Router(
      notFoundHandler: notFoundHandler,
    );
  }

  Future<Response> notFoundHandler(Request request) async {
    return BaseResponses.notFound;
  }
}
