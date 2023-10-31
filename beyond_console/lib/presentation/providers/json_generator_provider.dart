import 'package:beyond_console/domain/data_type.dart';
import 'package:beyond_console/domain/fill_criteria.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JsonGeneratorProvider extends ChangeNotifier {
  final selectedDataType = ValueNotifier<DataType?>(null);
  final selectedFillCriteria = ValueNotifier<FillCriteria?>(null);
  final selectedChildDataType = ValueNotifier<DataType?>(null);
  final dateRange =
      ValueNotifier<(DateTime? startDate, DateTime? endDate)?>(null);
  final today = DateTime.now();

  List<DropdownMenuItem<DataType>> dataTypeSelection(BuildContext context) {
    return [
      ...DataType.values.map(
        (DataType value) => DropdownMenuItem<DataType>(
          value: value,
          child: Text(value.title),
        ),
      ),
    ];
  }

  List<DropdownMenuItem<FillCriteria>>? fillCriteria(
    BuildContext context,
    DataType? selectedDataType,
  ) {
    if (selectedDataType == null) {
      return [];
    }
    final values = FillCriteria.chainedValues(selectedDataType)!.map(
      (FillCriteria value) {
        return DropdownMenuItem<FillCriteria>(
          value: value,
          child: Text(value.title),
        );
      },
    ).toList();
    debugPrint(values.toString());
    return values;
  }

  Future<void> pickStartDate(BuildContext context) async {
    final pickedStartDate = await showDatePicker(
      context: context,
      initialDate: dateRange.value?.$1 ?? today,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    dateRange.value = (
      pickedStartDate,
      dateRange.value?.$2,
    );
  }

  Future<void> pickEndDate(BuildContext context) async {
    final pickedEndDate = await showDatePicker(
      context: context,
      initialDate: dateRange.value?.$2 ?? today,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    dateRange.value = (
      dateRange.value?.$1,
      pickedEndDate,
    );
  }
}

final jsonGeneratorProvider = ChangeNotifierProvider(
  (ref) => JsonGeneratorProvider(),
);
