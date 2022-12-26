class Condition {
  String field;
  String operator;
  dynamic value;

  Condition({
    required this.field,
    this.operator = '=',
    required this.value,
  });

  Map<String, dynamic> toPayload() => {
        field: value,
      };
}
