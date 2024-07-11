import 'dart:async';
import 'dart:convert';

import 'package:beyond_ext/beyond_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_client/web_socket_client.dart';
import 'package:web_socket_client/web_socket_client.dart' as wsc;

import '../facades/utility_facade.dart';

class NetworkProvider extends ChangeNotifier {
  final utilityFacade = UtilityFacade();
  final ipAddressController = TextEditingController();
  final portController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final _connectionController = StreamController<dynamic>.broadcast();
  WebSocket? socket;
  Stream<dynamic> get connectionStatus => _connectionController.stream;
  Future<String?> get serverIp async {
    final useCase = utilityFacade.retrieveIpAddress;
    return useCase.execute(null);
  }

  @override
  void dispose() {
    super.dispose();
    _connectionController.close();
  }

  void updateConnectionStatus(wsc.ConnectionState status) {
    _connectionController.add(status);

    if (status is Connected) {
      final message = Message(
        metadata: Metadata(
          clientType: 'dashboard',
          actionType: 'create-room',
          clientId: 'Server01',
        ),
        payload: Payload(
          roomId: 'Server01',
        ),
      );

      socket!.send(
        jsonEncode(
          message.toJson(),
        ),
      );
    }
  }

  Future<void> connectWebSocket(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      try {
        final ip = ipAddressController.text;
        final port = portController.text;

        socket = WebSocket(
          Uri.parse(
            'ws://$ip:$port',
          ),
          timeout: const Duration(
            seconds: 30,
          ),
        );

        socket?.messages.listen(
          (message) {
            debugPrint('[Web Socket] Message: $message');
          },
          onError: (error) {
            debugPrint('[Web Socket] Error: ${error.toString()}');
          },
          onDone: () {
            debugPrint('[Web Socket] Connection closed');
          },
        );

        socket?.connection.listen(
          (state) {
            updateConnectionStatus(state);
          },
        );
      } catch (e) {
        final snackBar = SnackBar(
          content: Text(
            'Failed to connect, ERROR : ${e.toString()}',
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          snackBar,
        );
      }
    }
  }

  void clearIpAddress() {
    ipAddressController.clear();
  }
}

final networkProvider = ChangeNotifierProvider(
  (ref) => NetworkProvider(),
);
