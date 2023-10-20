import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/utils/route_util.dart';

class GlobalProvider extends ChangeNotifier {
  Brightness get brightness => Brightness.dark;
  RouteUtil get routeUtil => RouteUtil();
}

final globalProvider = ChangeNotifierProvider(
  (ref) => GlobalProvider(),
);
