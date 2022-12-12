class TextUtil {
  static String capital(String value) {
    value = value.toString();
    return value[0].toUpperCase() + value.substring(1);
  }

  static String propercase(String value) {
    if (value.length > 2) {
      return value.replaceAll(
        RegExp(r'/\w\S*/g'),
        value[0].toLowerCase() + value.substring(1),
      );
    } else {
      return value.toLowerCase();
    }
  }

  static String upperCamelCase(String value) {
    var result = '';
    final words = value.split(
      RegExp(r'(?=[A-Z])'),
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
