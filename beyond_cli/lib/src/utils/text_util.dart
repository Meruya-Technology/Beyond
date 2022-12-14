class TextUtil {
  static String capital(String value) {
    value = value.toString();
    return value[0].toUpperCase() + value.substring(1);
  }

  static String camelCase(String value) {
    var result = '';
    final words = value.split(
      RegExp(r'(?=[A-Z_])'),
    );
    for (var word in words) {
      final sanitizedWord = word.replaceAll(
        RegExp(r'[^a-zA-Z\d\s:]'),
        '',
      );
      result += capital(sanitizedWord);
    }
    return result[0].toLowerCase() + result.substring(1);
  }

  static String upperCamelCase(String value) {
    var result = '';
    final words = value.split(
      RegExp(r'(?=[A-Z_])'),
    );
    for (var word in words) {
      final sanitizedWord = word.replaceAll(
        RegExp(r'[^a-zA-Z\d\s:]'),
        '',
      );
      result += capital(sanitizedWord);
    }
    return result;
  }

  static String snakeCase(String value) {
    var result = '';
    final words = value.split(
      RegExp(r'(?=[A-Z])'),
    );
    for (var i = 0; i < words.length; i++) {
      final separator = (i != 0 && i != words.length) ? '_' : '';
      result += '$separator${words[i].toLowerCase()}';
    }
    return result;
  }
}
