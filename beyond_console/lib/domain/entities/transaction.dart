class Transaction {
  final String label;
  final int value;
  final double percentage;

  Transaction({
    required this.label,
    required this.value,
    this.percentage = 0.0,
  });

  Transaction copyWith({
    String? label,
    int? value,
    double? percentage,
  }) =>
      Transaction(
        label: label ?? this.label,
        value: value ?? this.value,
        percentage: percentage ?? this.percentage,
      );
}
