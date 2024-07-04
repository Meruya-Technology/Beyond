import 'package:beyond_console/common/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../common/const/dimensions.dart';

class BreadCrumb extends StatelessWidget {
  final String title;
  final String subTitle;

  const BreadCrumb({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.headlineSmall,
        ),
        const SizedBox(
          height: Dimensions.xxs,
        ),
        Text(
          subTitle,
          style: context.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
