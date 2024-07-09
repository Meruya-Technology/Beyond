import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_client/web_socket_client.dart';
import 'package:web_socket_client/web_socket_client.dart' as wsc;

import '../facades/utility_facade.dart';

class NetworkProvider extends ChangeNotifier {
  final utilityFacade = UtilityFacade();
  final ipAddressController = TextEditingController();
  final _connectionController = StreamController<dynamic>.broadcast();
  WebSocket? socket;
  Stream<dynamic> get connectionStatus => _connectionController.stream;

  Future<String?> get serverIp async {
    final useCase = utilityFacade.retrieveIpAddress;
    return useCase.execute(null);
  }

  NetworkProvider() {
    initializeWebSocket();
  }

  @override
  void dispose() {
    super.dispose();
    _connectionController.close();
  }

  void initializeWebSocket() async {}

  // Method to update connection status
  void updateConnectionStatus(wsc.ConnectionState status) {
    _connectionController.add(status);

    if (status is Connected) {
      socket!.send(
        jsonEncode(
          {
            'clientId': 'Server01',
            'roomId': 'Server01',
            'metadata': {
              'clientType': 'dashboard',
              'actionType': 'initialize',
            },
            'payload': {},
          },
        ),
      );
    }
  }

  Future<void> connectWebSocket() async {
    socket = WebSocket(
      Uri.parse(
        'ws://192.168.18.2:8080',
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
  }

  void clearIpAddress() {
    ipAddressController.clear();
  }
}

final networkProvider = ChangeNotifierProvider(
  (ref) => NetworkProvider(),
);
