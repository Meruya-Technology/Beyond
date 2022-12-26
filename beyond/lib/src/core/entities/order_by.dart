class OrderBy {
  String field;
  String clause;

  OrderBy({
    required this.field,
    this.clause = 'asc',
  });
}
