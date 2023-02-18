import 'package:beyond/beyond.dart';

abstract class BaseDB<M> {
  Future<List<Map<String, dynamic>?>?> select({
    /// List<String> for where conditions, Example : [ "name = 'jhon'" ]
    List<Condition>? conditions,

    /// Example [['field', 'asc']]
    List<OrderBy>? orders,
  });

  /// Create single or multiple record into database straight from entity or
  /// List of entity
  Future<int> create();

  /// update data from specific table using model instance + conditions
  Future<int> update(List<Condition> conditions);

  /// delete data from specific table with conditions
  Future<int> delete(List<Condition> conditions);
}
