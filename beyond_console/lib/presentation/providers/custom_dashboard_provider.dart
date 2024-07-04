import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomDashboardProvider extends ChangeNotifier {}

final dashboardProvider = ChangeNotifierProvider(
  (ref) => CustomDashboardProvider(),
);
