import 'package:beyond_console/presentation/facades/utility_facade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectProvider extends ChangeNotifier {
  final utilityFacade = UtilityFacade();

  Future<String?> get serverIp async {
    final useCase = utilityFacade.retrieveIpAddress;
    return useCase.execute(null);
  }
}

final connectProvider = ChangeNotifierProvider(
  (ref) => ConnectProvider(),
);
