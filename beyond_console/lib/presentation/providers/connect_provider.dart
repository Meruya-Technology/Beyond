import 'package:beyond_console/common/utils/math_util.dart';
import 'package:beyond_console/presentation/facades/beyond_facade.dart';
import 'package:beyond_console/presentation/facades/utility_facade.dart';
import 'package:beyond_console/presentation/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ConnectProvider extends ChangeNotifier {
  final utilityFacade = UtilityFacade();
  final beyondFacade = BeyondFacade();
  final roomIdController = TextEditingController();

  ConnectProvider() {
    initialize();
  }

  Future<void> initialize() async {
    final lastRoomId = await retrieveRoomId();
    final initialValue = lastRoomId ?? MathUtil.generateAlphaNumeric(6);
    roomIdController.text = initialValue;
  }

  Future<String?> get serverIp async {
    final useCase = utilityFacade.retrieveIpAddress;
    return useCase.execute(null);
  }

  Future<String?> retrieveRoomId() {
    final useCase = beyondFacade.retrieveRoomId;
    return useCase.execute(null);
  }

  void saveRoomId(BuildContext context) {
    final useCase = beyondFacade.saveRoomId;
    useCase.execute(roomIdController.text).then(
      (result) {
        if (result) {
          context.go(
            DashboardPage.routeName,
          );
        }
      },
    );
  }
}

final connectProvider = ChangeNotifierProvider(
  (ref) => ConnectProvider(),
);
