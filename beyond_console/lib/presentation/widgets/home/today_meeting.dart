import 'package:beyond_console/common/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../common/const/dimensions.dart';
import 'today_meeting_tile.dart';

class TodayMeeting extends StatelessWidget {
  const TodayMeeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(
          Dimensions.l,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today\'s meetings',
              style: context.textTheme.titleMedium,
            ),
            const SizedBox(
              height: Dimensions.m,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              separatorBuilder: (context, index) => const SizedBox(
                height: Dimensions.m,
              ),
              itemBuilder: (context, index) => TodayMeetingTile(),
            ),
          ],
        ),
      ),
    );
  }
}
