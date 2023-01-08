import 'package:beyond/src/core/db/query_builder.dart';
import 'package:get_it/get_it.dart';
import 'package:postgres/postgres.dart';

import '../../utils/db_util.dart';
import '../../utils/mirror_util.dart';
import '../entities/condition.dart';
import '../entities/order_by.dart';
import 'base_db.dart';

class DB<M> implements BaseDB<M> {
  final M? model;

  DB({
    this.model,
  });

  PostgreSQLConnection get _database => GetIt.instance<PostgreSQLConnection>();
  MirrorUtil get _mirror => MirrorUtil(model ?? M);
  DBUtil get _dbUtil => DBUtil(mirror: _mirror);

  /// In order to use DB, it will needed to be initialize first. Because DB
  /// require PostgreSQLConnection to be put inside singleton first
  /// TODO : Initialize mechanism can be more independence
  static Future<void> initialize(PostgreSQLConnection postgresql) async {
    final getIt = GetIt.instance;
    getIt.registerSingleton<PostgreSQLConnection>(postgresql);
  }

  @override
  Future<int> insert() {
    final payload = _dbUtil.singleInsertPayload;
    return _database.execute(
      QueryBuilder.insert(
        payload,
        schema: _mirror.tableSchema,
        tableName: _mirror.tableName,
      ),
      substitutionValues: payload,
    );
  }

  /// TODO : support join operation, smart result mapper
  @override
  Future<List<Map<String, dynamic>?>?> select({
    List<Condition>? conditions,
    List<OrderBy>? orders,
  }) async {
    final results = await _database.mappedResultsQuery(
      QueryBuilder.select(
        tableName: _mirror.tableName,
        schema: _mirror.tableSchema,
        conditions: conditions,
        orderBy: orders,
      ),
      substitutionValues: _dbUtil.mapConditionToPayload(
        conditions,
      ),
    );

    /// Map List<Map<String, Map<String, dynamic>>> to List<Map<String, dynamic>>
    final newResults =
        results.map((result) => result[_mirror.tableName]).toList();

    /// Convert to json able result
    final convertedResult = newResults.map((nr) {
      final result = _dbUtil.mapSelectOutput(nr);
      return result;
    }).toList();
    return convertedResult;
  }

  @override
  Future<int> delete(List<Condition> conditions) {
    return _database.execute(
      QueryBuilder.delete(
        schema: _mirror.tableSchema,
        tableName: _mirror.tableName,
        conditions: conditions,
      ),
      substitutionValues: _dbUtil.mapConditionToPayload(
        conditions,
      ),
    );
  }

  @override
  Future<int> update(List<Condition> conditions) {
    final payload = _dbUtil.updatePayload;
    return _database.execute(
      QueryBuilder.update(
        payload,
        schema: _mirror.tableSchema,
        tableName: _mirror.tableName,
        conditions: conditions,
      ),
      substitutionValues: payload
        ..addAll(
          _dbUtil.mapConditionToPayload(
            conditions,
          )!,
        ),
    );
  }
}
