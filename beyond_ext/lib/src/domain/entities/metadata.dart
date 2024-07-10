class Metadata {
  final String clientId;
  final String clientType;
  final String actionType;

  Metadata({
    required this.clientId,
    required this.clientType,
    required this.actionType,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        clientId: json['clientId'],
        clientType: json['clientType'],
        actionType: json['actionType'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['clientId'] = clientId;
    json['clientType'] = clientType;
    json['actionType'] = actionType;
    return json;
  }
}
