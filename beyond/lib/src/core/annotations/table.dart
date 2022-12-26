/// Table metadata, this annotation will used in DB methods operation. Therefore
/// the default value for table name will be class name itself + s, meanwhile
/// the default schema will be the public schema for postgresql.
class Table {
  /// This metadata field will override default table name which is based on
  /// class name + s
  final String name;

  /// This metadata field will override default schema which is public for
  /// postgresql
  final String? schema;

  const Table({
    required this.name,
    this.schema,
  });
}
