import 'dart:mirrors';

import '../../utils/data_util.dart';
import '../../utils/mirror_util.dart';
import 'base_model.dart';

/// Beyond model enable class model to convert the data from class into map.
/// So it can be jsonEncoded later for http json response, to use beyond model
/// use `extends model` from intended class model
class Model implements BaseModel {
  MirrorUtil get _mirror => MirrorUtil(this);

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> payload = {};
    for (var variable in _mirror.variables) {
      /// Get field metadata
      final field = _mirror.getField(variable);

      /// If the field is not hidden
      if (!(field?.isHidden ?? false)) {
        /// Construct variable name from field metadata (key), if its empty the
        /// default name will be the class variable name it self.
        final variableName = field?.key ??
            MirrorSystem.getName(
              variable.simpleName,
            );

        /// Construct variable value
        final variableValue = _mirror.instanceMirror.getField(
          variable.simpleName,
        );

        /// Check if the value is eligible to put in json / map
        if (DataUtil.isJsonAble(variableValue)) {
          payload[variableName] =
              variableValue.reflectee ?? field?.defaultValue;
        }
      }

      /// If its hidden do nothing
    }
    return payload;
  }
}
