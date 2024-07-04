import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonProvider extends ChangeNotifier {}

final buttonProvider = ChangeNotifierProvider(
  (ref) => ButtonProvider(),
);
