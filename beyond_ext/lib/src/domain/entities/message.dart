import 'metadata.dart';
import 'payload.dart';

class Message {
  final Metadata metadata;
  final Payload? payload;

  Message({
    required this.metadata,
    this.payload,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        metadata: Metadata.fromJson(
          json['metadata'],
        ),
        payload: Payload.fromJson(
          json['payload'],
        ),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['metadata'] = metadata.toJson();
    json['payload'] = payload?.toJson();
    return json;
  }
}
