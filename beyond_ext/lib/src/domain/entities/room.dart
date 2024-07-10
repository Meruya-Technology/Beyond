// ignore: depend_on_referenced_packages
import 'package:web_socket_channel/web_socket_channel.dart';

class Room {
  String roomId;
  List<String>? users;
  WebSocketChannel? channel;

  Room({
    required this.roomId,
    this.users,
    this.channel,
  });

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        roomId: json['roomId'],
        users: json['users'].cast<String>(),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roomId'] = roomId;
    data['users'] = users;
    return data;
  }
}
