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
        clientId: 'Server01',
        roomId: 'Server01',
        metadata: Metadata(
          clientType: 'dashboard',
          actionType: 'connected',
        ),
        payload: {},
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
            debugPrint('New message ! $message');
          },
          onError: (error) {
            debugPrint('Socket has error $error');
          },
          onDone: () {
            debugPrint('Socket has done');
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
