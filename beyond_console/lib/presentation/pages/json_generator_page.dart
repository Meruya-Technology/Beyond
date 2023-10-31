import 'package:beyond_console/domain/data_type.dart';
import 'package:beyond_console/presentation/providers/json_generator_provider.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/const/dimensions.dart';
import '../../domain/fill_criteria.dart';

class JsonGeneratorPage extends ConsumerWidget {
  static const routeName = '/json-generator';

  const JsonGeneratorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(jsonGeneratorProvider);
    return SingleChildScrollView(
      child: buildBody(context, provider),
    );
  }

  Widget buildBody(BuildContext context, JsonGeneratorProvider provider) {
    return Container(
      padding: const EdgeInsets.all(
        Dimensions.l,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(
                      Dimensions.m,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  label: Text('Field'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: Dimensions.m,
                            ),
                            Expanded(
                              child: DropdownButtonFormField<DataType>(
                                items: provider.dataTypeSelection(context),
                                onChanged: (newValue) {
                                  provider.selectedDataType.value = newValue;
                                  provider.selectedFillCriteria.value = null;
                                  provider.selectedChildDataType.value = null;
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Data type',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: Dimensions.m,
                            ),
                            ValueListenableBuilder(
                              valueListenable: provider.selectedDataType,
                              builder: (context, selectedDataType, child) {
                                return Visibility(
                                  visible: selectedDataType != null &&
                                      DataType.childrens(selectedDataType) !=
                                          null,
                                  child: Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        right: Dimensions.m,
                                      ),
                                      child: DropdownButtonFormField<DataType>(
                                        items: (selectedDataType != null)
                                            ? DataType.childrens(
                                                    selectedDataType)
                                                ?.map(
                                                (DataType value) {
                                                  return DropdownMenuItem<
                                                      DataType>(
                                                    value: value,
                                                    child: Text(value.title),
                                                  );
                                                },
                                              ).toList()
                                            : [],
                                        onChanged: (newValue) {
                                          provider.selectedChildDataType.value =
                                              newValue;
                                        },
                                        decoration: const InputDecoration(
                                          labelText: 'Child data type',
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: Dimensions.m,
              ),
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(
                      Dimensions.m,
                    ),
                    child: Row(
                      children: [
                        ValueListenableBuilder(
                          valueListenable: provider.selectedDataType,
                          builder: (context, selectedDataType, child) {
                            return (selectedDataType != null)
                                ? Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        right: Dimensions.m,
                                      ),
                                      child:
                                          DropdownButtonFormField<FillCriteria>(
                                        items: provider.fillCriteria(
                                          context,
                                          selectedDataType,
                                        ),
                                        onChanged: (newValue) {
                                          provider.selectedFillCriteria.value =
                                              newValue;
                                        },
                                        decoration: const InputDecoration(
                                          labelText: 'Fill criteria',
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink();
                          },
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              label: Text('Start date'),
                            ),
                            onTap: () => provider.pickStartDate(context),
                          ),
                        ),
                        const SizedBox(
                          width: Dimensions.m,
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              label: Text('End date'),
                            ),
                            onTap: () => provider.pickEndDate(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          buttonSection(context),
        ],
      ),
    );
  }

  Widget buttonSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Dimensions.m,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FilledButton.icon(
            icon: const Icon(
              FeatherIcons.plusCircle,
              size: 16,
            ),
            label: const Text('Add'),
            onPressed: () {},
          ),
          const SizedBox(
            width: Dimensions.m,
          ),
          FilledButton.icon(
            icon: const Icon(
              FeatherIcons.save,
              size: 16,
            ),
            label: const Text('Generate'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
