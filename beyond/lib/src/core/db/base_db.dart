import '../entities/condition.dart';
import '../entities/order_by.dart';

abstract class BaseDB<M> {
  Future<List<Map<String, dynamic>?>?> select({
    /// List<String> for where conditions, Example : [ "name = 'jhon'" ]
    List<Condition>? conditions,

    /// Example [['field', 'asc']]
    List<OrderBy>? orders,
  });

  Future<int> delete(List<Condition> conditions);

  Future<int> insert();

  Future<int> update(List<Condition> conditions);
}
