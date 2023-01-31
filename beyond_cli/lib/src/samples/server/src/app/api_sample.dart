class ApiSample {
  static String get content => '''
import 'package:beyond/beyond.dart';
import 'package:shelf_router/shelf_router.dart';

import 'controllers/user_controller.dart';

/// This class is the main route map to bind every route, into controller
/// also we can add a suffix or global handler, depend on the purposes

class Api extends BaseApi {
  Router get getRoutes => baseRouter
    ..get('/user/<data>', UserController.getUser)
    ..post('/user/register', UserController.createUser)
    ..delete('/user/<id>', UserController.deleteUser)
    ..put('/user/<id>', UserController.updateUser);
}
''';
}
