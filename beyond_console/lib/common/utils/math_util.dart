import 'dart:math';

class MathUtil {
  static int generateRangedValue(int start, int end) {
    final random = Random();
    return start + random.nextInt(end - start);
  }
}
