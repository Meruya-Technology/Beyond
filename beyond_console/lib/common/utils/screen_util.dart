import 'package:flutter/material.dart';

import '../const/dimensions.dart';

class ScreenUtil {
  static EdgeInsets getBodyPadding(double width) {
    if (width < 577) {
      return const EdgeInsets.all(0);
    } else if (width >= 576 && width < 768) {
      return const EdgeInsets.all(0);
    } else if (width >= 768 && width < 992) {
      return const EdgeInsets.all(0);
    } else if (width >= 992 && width < 1200) {
      return const EdgeInsets.all(0);
    } else if (width >= 1200 && width < 1400) {
      return const EdgeInsets.all(0);
    } else if (width >= 1400 && width < 1600) {
      return const EdgeInsets.all(0);
    } else if (width >= 1600) {
      return const EdgeInsets.symmetric(
        horizontal: Dimensions.xxl,
      );
    } else {
      return const EdgeInsets.all(0);
    }
  }
}
