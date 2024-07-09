import 'package:beyond_console/common/const/dimensions.dart';
import 'package:beyond_console/presentation/widgets/home/monthly_transaction.dart';
import 'package:beyond_console/presentation/widgets/home/today_meeting.dart';
import 'package:beyond_console/presentation/widgets/home/top_item.dart';
import 'package:beyond_console/presentation/widgets/home/yearly_transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/home_provider.dart';
import '../widgets/composables/bread_crumb.dart';
import '../widgets/home/order_pie_chart.dart';
import '../widgets/home/weekly_transaction.dart';

class HomePage extends ConsumerWidget {
  static const routeName = '/';

  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(homeProvider);
    return buildBody(context, provider);
  }

  Widget buildBody(BuildContext context, HomeProvider provider) {
    return Container(
      padding: const EdgeInsets.all(
        Dimensions.l,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const BreadCrumb(
            title: 'Welcome',
            subTitle: 'Beyond Console',
          ),
          const SizedBox(
            height: Dimensions.m,
          ),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Expanded(
          //       flex: 1,
          //       child: weeklyTransaction(context, provider),
          //     ),
          //     const SizedBox(
          //       width: Dimensions.m,
          //     ),
          //     Expanded(
          //       flex: 1,
          //       child: monthlyTransaction(context, provider),
          //     ),
          //     const SizedBox(
          //       width: Dimensions.m,
          //     ),
          //     Expanded(
          //       flex: 1,
          //       child: yearlyTransaction(context, provider),
          //     ),
          //   ],
          // ),
          // const SizedBox(
          //   height: Dimensions.m,
          // ),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Expanded(
          //       child: buildCurrentTransaction(
          //         context,
          //         provider,
          //       ),
          //     ),
          //     const SizedBox(
          //       width: Dimensions.m,
          //     ),
          //     projectChart(context, provider),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget weeklyTransaction(BuildContext context, HomeProvider provider) {
    return WeeklyTransaction(
      transactions: provider.weeklyTransaction,
    );
  }

  Widget monthlyTransaction(BuildContext context, HomeProvider provider) {
    return MonthlyTransaction(
      transactions: provider.monthlyTransaction,
    );
  }

  Widget yearlyTransaction(BuildContext context, HomeProvider provider) {
    return YearlyTransaction(
      transactions: provider.weeklyTransaction,
    );
  }

  Widget projectChart(BuildContext context, HomeProvider provider) {
    return OrderPieChart(
      projects: provider.orders,
    );
  }

  Widget todayMeetings(BuildContext context) {
    return const TodayMeeting();
  }

  Widget buildCurrentTransaction(BuildContext context, HomeProvider provider) {
    return TopItem(
      items: provider.topItems,
    );
  }
}
