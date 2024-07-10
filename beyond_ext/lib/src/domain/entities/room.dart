// ignore: depend_on_referenced_packages
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../beyond_ext.dart';

class Room {
  String roomId;
  List<Device>? devices;
  WebSocketChannel? channel;

  Room({
    required this.roomId,
    this.devices,
    this.channel,
  });

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        roomId: json['roomId'],
        devices: List<Device>.from(
          json['devices'].map(
            (device) => Device.fromJson(device),
          ),
        ),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roomId'] = roomId;
    data['devices'] = devices;
    return data;
  }
}
