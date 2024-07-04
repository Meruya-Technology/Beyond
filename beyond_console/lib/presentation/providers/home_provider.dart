import 'package:beyond_console/common/const/data_formats.dart';
import 'package:beyond_console/common/extensions/nullable_int_extension.dart';
import 'package:beyond_console/domain/item.dart';
import 'package:beyond_console/domain/transaction.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/utils/math_util.dart';
import '../../domain/order.dart';

class HomeProvider extends ChangeNotifier {
  final orders = [
    Order(
      color: Colors.cyan,
      name: 'Smartphone',
      icon: FeatherIcons.smartphone,
      percentage: 25,
      amount: 25000,
    ),
    Order(
      color: Colors.purple,
      name: 'Fashion',
      icon: FeatherIcons.shoppingBag,
      percentage: 23,
      amount: 23000,
    ),
    Order(
      color: Colors.lightGreen,
      name: 'Camera',
      icon: FeatherIcons.camera,
      percentage: 32,
      amount: 32000,
    ),
    Order(
      color: Colors.red,
      name: 'Decor',
      icon: FeatherIcons.home,
      percentage: 12.5,
      amount: 12500,
    ),
    Order(
      color: Colors.yellow,
      name: 'Office Supplies',
      icon: FeatherIcons.paperclip,
      percentage: 7.5,
      amount: 7500,
    ),
  ];

  final topItems = [
    Item(
      name: 'iPhone 15 Pro Max',
      totalSales: 25000,
      sold: 25,
      stock: 0,
      category: 'Smartphone',
      categoryIcon: FeatherIcons.smartphone,
      categoryIconColor: Colors.cyan,
    ),
  ];

  /// Weekly transaction data, anyone can ignore this as this only
  /// for demo purpose andonly.
  List<Transaction> get weeklyTransaction {
    /// Get current weekday
    final currentDay = DataFormats.currentDate.weekday;

    /// Generate list of Transaction based on 7 days
    final transactions = List<Transaction>.generate(
      7,
      (index) {
        /// Get previous day
        var day = currentDay - (index);

        /// Check if the day is less than 0 it means it's on the previous week
        /// equal to 0 or less it means the day is on the previous week
        if (day <= 0) {
          /// If so then the logic will reverse to get week day number of the
          /// previous week. With 7 + (0 or minus day)
          day = (7 + day);
        }

        /// Return Transaction with fullday name and generated ranged value
        return Transaction(
          label: day.fullDayName ?? 'N/A',
          value: MathUtil.generateRangedValue(10000, 25000),
        );
      },

      /// Last but not least, reverse it so it can be displayed in chart like
      /// backwards
    ).reversed;

    /// Get total amount from transactions
    final totalAmount = transactions
        .map((transaction) => transaction.value)
        .fold(0, (prev, next) => prev + next);

    /// Distribute percentage to each transactions
    final result = transactions.map(
      (transaction) => transaction.copyWith(
        percentage: (transaction.value / totalAmount) * 100,
      ),
    );

    /// Convert to list
    return result.toList();
  }

  List<Transaction> get monthlyTransaction {
    final now = DataFormats.currentDate;
    var firstDayOfMonth = DateTime(now.year, now.month, 1);
    var dayOfFirst = firstDayOfMonth.weekday;
    var offset = (dayOfFirst - 1 + now.day) ~/ 7;
    final length = (offset > 2) ? offset : 5;
    final transactions = List<Transaction>.generate(
      length,
      (index) => Transaction(
        label: 'Week ${index + 1}',
        value: MathUtil.generateRangedValue(100000, 250000),
      ),
    );

    /// Get total amount from transactions
    final totalAmount = transactions
        .map((transaction) => transaction.value)
        .fold(0, (prev, next) => prev + next);

    /// Distribute percentage to each transactions
    final result = transactions.map(
      (transaction) => transaction.copyWith(
        percentage: (transaction.value / totalAmount) * 100,
      ),
    );

    /// Convert to list
    return result.toList();
  }
}

final homeProvider = ChangeNotifierProvider(
  (ref) => HomeProvider(),
);
