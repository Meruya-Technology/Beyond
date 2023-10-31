import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JsonToDartProvider extends ChangeNotifier {}

final jsonToDartProvider = ChangeNotifierProvider(
  (ref) => JsonToDartProvider(),
);
