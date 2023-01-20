class ModelV2Sample {
  static String content(String className) => '''
import 'package:beyond/beyond.dart';

/// Table meta data, name, schema
@Table(
  name: 'example',
  schema: 'exampleSchema',
)

/// For now every fields on this model must be nullable, in order to avoid
/// hardcode when initialize empty class for select, and delete method. The
/// empty class initialization is required for mirror purposes
class $className extends Model {
  @Field(
    field: 'id',
    key: 'id',
    defaultValue: null,
    isFillable: false,
    isHidden: true,
    isUpdateable: false,
  )
}
''';
}
