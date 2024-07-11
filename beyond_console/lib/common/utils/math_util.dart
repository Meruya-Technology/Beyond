import 'dart:math';

class MathUtil {
  static int generateRangedValue(int start, int end) {
    final random = Random();
    return start + random.nextInt(end - start);
  }

  static String generateAlphaNumeric(int length) {
    const seed = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();
    return List.generate(
      length,
      (index) => seed[random.nextInt(seed.length)],
    ).join('');
  }
}
