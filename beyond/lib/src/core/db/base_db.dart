import 'package:beyond/beyond.dart';

abstract class BaseDB<M> {
  Future<List<Map<String, dynamic>?>?> select({
    /// List<String> for where conditions, Example : [ "name = 'jhon'" ]
    List<Condition>? conditions,

    /// Example [['field', 'asc']]
    List<OrderBy>? orders,
  });

  /// insert data from instance by converting it first into desired payload
  Future<int> insert();

  /// update data from specific table using model instance + conditions
  Future<int> update(List<Condition> conditions);

  /// delete data from specific table with conditions
  Future<int> delete(List<Condition> conditions);
}
