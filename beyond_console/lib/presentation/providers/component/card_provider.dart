import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardProvider extends ChangeNotifier {}

final cardProvider = ChangeNotifierProvider(
  (ref) => CardProvider(),
);
