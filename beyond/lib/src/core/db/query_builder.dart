import '../entities/condition.dart';
import '../entities/order_by.dart';

class QueryBuilder {
  final defaultClause = 'asc';
  final orders = [];
  final conditions = [];

  static String target(String? schema, String tableName) =>
      (schema != null) ? '$schema."$tableName"' : '"$tableName"';

  static String insert(
    Map<String, dynamic> payload, {
    String? schema,
    required String tableName,
  }) {
    final fields = [];
    final values = [];
    payload.forEach((key, value) {
      fields.add(key);
      values.add('@$key');
    });
    return '''INSERT INTO ${target(schema, tableName)} (${fields.join(', ')}) 
      VALUES (${values.join(', ')});''';
  }

  static String update(
    Map<String, dynamic> payload, {
    required List<Condition> conditions,
    String? schema,
    required String tableName,
  }) {
    final fields = [];
    payload.forEach((key, value) {
      fields.add('$key = @$key');
    });

    var query =
        '''UPDATE ${target(schema, tableName)} SET ${fields.join(', ')}''';
    query += ' ${where(conditions)}';
    return '$query;';
  }

  /// orderBy : column1, column2
  static String select({
    String? schema,
    required String tableName,
    List<Condition>? conditions,
    List<OrderBy>? orderBy,
  }) {
    var query = 'select * from ${target(schema, tableName)}';
    if (conditions != null) query += ' ${where(conditions)}';
    if (orderBy != null) query += ' ${order(orderBy)}';
    return '$query;';
  }

  static String delete({
    required List<Condition> conditions,
    String? schema,
    required String tableName,
  }) {
    var query =
        '''delete from ${target(schema, tableName)} ${where(conditions)}''';
    return '$query;';
  }

  static String where(List<Condition> conditions) {
    var query = '';

    /// Loop condition to construct query
    for (var i = 0; i < conditions.length; i++) {
      /// Filter if value != null continue the process
      if (conditions[i].value != null) {
        /// Compile condition [field, operator, value]
        final condition =
            '${conditions[i].field} ${conditions[i].operator} @${conditions[i].field}';
        query += (query.isNotEmpty) ? '\nwhere $condition' : '\nand $condition';
      }
    }

    return query;
  }

  static String order(List<OrderBy> orders) {
    var query = '\norder by ';
    for (var i = 0; i < orders.length; i++) {
      final newOrder = orders.map((order) => '${order.field} ${order.clause}');
      query += newOrder.join(', ');
    }
    return query;
  }
}
