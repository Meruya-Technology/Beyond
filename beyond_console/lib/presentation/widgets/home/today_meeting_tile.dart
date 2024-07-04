import 'package:beyond_console/common/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../common/const/dimensions.dart';

class TodayMeetingTile extends StatelessWidget {
  const TodayMeetingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.colorScheme.surface,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.s,
        vertical: Dimensions.xs,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '10:00',
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: Dimensions.xxs,
                  ),
                  Text(
                    'AM',
                    style: context.textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
          Text(
            'Daily Standup meeting with the team',
            style: context.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
