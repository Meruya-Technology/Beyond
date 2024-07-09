import 'metadata.dart';

class Message {
  final String clientId;
  final String roomId;
  final Metadata metadata;
  final dynamic payload;

  Message({
    required this.clientId,
    required this.roomId,
    required this.metadata,
    this.payload,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        clientId: json['clientId'],
        roomId: json['roomId'],
        metadata: Metadata.fromJson(
          json['metadata'],
        ),
        payload: json['payload'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['clientId'] = clientId;
    json['roomId'] = roomId;
    json['metadata'] = metadata.toJson();
    json['payload'] = payload;
    return json;
  }
}
