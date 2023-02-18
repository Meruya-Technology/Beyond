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

  static Future<void> initialize(PostgreSQLConnection postgresql) async {
    final getIt = GetIt.instance;
    getIt.registerSingleton<PostgreSQLConnection>(postgresql);
  }

  @override
  Future<int> create() async {
    if (model is List) {
      final models = model as List;
      final mirror = MirrorUtil(models.first);
      final payloads = List<Map<String, dynamic>>.generate(
        models.length,
        (index) {
          final dbUtil = DBUtil(
            mirror: MirrorUtil(models[index]),
          );
          return dbUtil.singleInsertPayload;
        },
      );

      final result = await _database.transaction(
        (connection) async {
          int records = 0;
          for (var payload in payloads) {
            final query = QueryBuilder.insert(
              payload,
              schema: mirror.tableSchema,
              tableName: mirror.tableName,
            );
            records += await connection
                .execute(query, substitutionValues: payload)
                .catchError(
              (onError) {
                connection.cancelTransaction(
                  reason: 'Error occured when inserting multipe records',
                );
              },
            );
          }
          return Future.value(records);
        },
      );
      return result ?? 0;
    } else {
      final mirror = MirrorUtil(model ?? M);
      final dbUtil = DBUtil(
        mirror: mirror,
      );
      final payload = dbUtil.singleInsertPayload;
      return _database.execute(
        QueryBuilder.insert(
          payload,
          schema: mirror.tableSchema,
          tableName: mirror.tableName,
        ),
        substitutionValues: payload,
      );
    }
  }

  @override
  Future<List<Map<String, dynamic>?>?> select({
    List<Condition>? conditions,
    List<OrderBy>? orders,
  }) async {
    final mirror = MirrorUtil(model ?? M);
    final dbUtil = DBUtil(mirror: mirror);
    final results = await _database.mappedResultsQuery(
      QueryBuilder.select(
        tableName: mirror.tableName,
        schema: mirror.tableSchema,
        conditions: conditions,
        orderBy: orders,
      ),
      substitutionValues: dbUtil.mapConditionToPayload(
        conditions,
      ),
    );

    /// Map List<Map<String, Map<String, dynamic>>> to List<Map<String, dynamic>>
    final newResults = results.map(
      (result) => result[mirror.tableName],
    );

    /// Convert to json able result
    final convertedResult = newResults.map(
      (newResult) {
        return dbUtil.mapSelectOutput(newResult);
      },
    );
    return convertedResult.toList();
  }

  @override
  Future<int> delete(List<Condition> conditions) {
    final mirror = MirrorUtil(model ?? M);
    final dbUtil = DBUtil(mirror: mirror);
    return _database.execute(
      QueryBuilder.delete(
        schema: mirror.tableSchema,
        tableName: mirror.tableName,
        conditions: conditions,
      ),
      substitutionValues: dbUtil.mapConditionToPayload(
        conditions,
      ),
    );
  }

  @override
  Future<int> update(List<Condition> conditions) {
    final mirror = MirrorUtil(model ?? M);
    final dbUtil = DBUtil(mirror: mirror);
    final payload = dbUtil.updatePayload;
    return _database.execute(
      QueryBuilder.update(
        payload,
        schema: mirror.tableSchema,
        tableName: mirror.tableName,
        conditions: conditions,
      ),
      substitutionValues: payload
        ..addAll(
          dbUtil.mapConditionToPayload(
            conditions,
          )!,
        ),
    );
  }
}
