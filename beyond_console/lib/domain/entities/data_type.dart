enum DataType {
  string,
  int,
  double,
  bool,
  list,
  map,
  date,
  empty;

  String get title => '${name[0].toUpperCase()}${name.substring(1)}';

  static List<DataType>? childrens(DataType dataType) {
    if (dataType == DataType.map || dataType == DataType.list) {
      return values;
    }
    return null;
  }
}
