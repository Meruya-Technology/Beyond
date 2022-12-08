class StdoutUtil {
  /// Format \n\x1b[38;5;39m$message\x1b[0m
  /// - \n for new line
  /// - \x1b for hexadecimal
  /// - [38; for foreground color
  /// - 5; color format (2 for soft color, 5 for rgb)
  /// - 39 for color code
  /// Color table : <br>
  /// <img src="https://user-images.githubusercontent.com/995050/47952855-ecb12480-df75-11e8-89d4-ac26c50e80b9.png" width="1000">
  static String printColor(
    String message, {
    String code = '39',
  }) =>
      '\x1b[38;5;${code}m$message\x1b[0m';
}
