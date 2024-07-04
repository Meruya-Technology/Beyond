import 'package:beyond_console/common/const/dimensions.dart';
import 'package:beyond_console/common/extensions/context_extension.dart';
import 'package:beyond_console/presentation/providers/component/button_provider.dart';
import 'package:beyond_console/presentation/widgets/composables/extended_elevated_button.dart';
import 'package:beyond_console/presentation/widgets/composables/extended_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/composables/bread_crumb.dart';

class ButtonPage extends ConsumerWidget {
  static const routeName = '/components/button';

  const ButtonPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(buttonProvider);
    return buildBody(context, provider);
  }

  Widget buildBody(BuildContext context, ButtonProvider provider) {
    return Container(
      padding: const EdgeInsets.all(
        Dimensions.l,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const BreadCrumb(
            title: 'Component',
            subTitle: 'Buttons',
          ),
          const SizedBox(
            height: Dimensions.m,
          ),
          elevatedButton(context),
          const SizedBox(
            height: Dimensions.m,
          ),
          filledButton(context),
          const SizedBox(
            height: Dimensions.m,
          ),
          outlinedButton(context),
        ],
      ),
    );
  }

  Widget elevatedButton(BuildContext context) {
    return Card(
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(Dimensions.m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Elevated Button & Elevated Button Icon',
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: Dimensions.xxs,
            ),
            Text(
              'Default Material 3 ElevatedButton does not support '
              'multiple color scheme usages on a global theme. Instead'
              ' use the ExtendedElevatedButton.primary or '
              'ExtendedElevatedButton.secondary or '
              'ExtendedElevatedButton.tertiary in order to use multiple '
              'Color scheme based on ElevatedButton global theme plus '
              'available Material 3 Color schemes !',
              style: context.textTheme.bodyMedium,
            ),
            const SizedBox(
              height: Dimensions.m,
            ),
            Row(
              children: [
                ExtendedElevatedButton.primary(
                  context,
                  onPressed: () {},
                  child: const Text('Primary'),
                ),
                const SizedBox(
                  width: Dimensions.xs,
                ),
                ExtendedElevatedButton.secondary(
                  context,
                  onPressed: () {},
                  child: const Text('Secondary'),
                ),
                const SizedBox(
                  width: Dimensions.xs,
                ),
                ExtendedElevatedButton.tertiary(
                  context,
                  onPressed: () {},
                  child: const Text('Tertiary'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget filledButton(BuildContext context) {
    return Card(
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(Dimensions.m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filled Button & Filled Button Icon',
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: Dimensions.xxs,
            ),
            Text(
              'Default Material 3 ElevatedButton does not support '
              'multiple color scheme usages on a global theme. Instead'
              ' use the ExtendedElevatedButton.primary or '
              'ExtendedElevatedButton.secondary or '
              'ExtendedElevatedButton.tertiary in order to use multiple '
              'Color scheme based on ElevatedButton global theme plus '
              'available Material 3 Color schemes !',
              style: context.textTheme.bodyMedium,
            ),
            const SizedBox(
              height: Dimensions.m,
            ),
            Row(
              children: [
                FilledButton(
                  onPressed: () {},
                  child: const Text('Primary'),
                ),
                const SizedBox(
                  width: Dimensions.xs,
                ),
                FilledButton.icon(
                  onPressed: () {},
                  label: const Text('Primary'),
                  icon: const Icon(Icons.abc),
                ),
                const SizedBox(
                  width: Dimensions.xs,
                ),
                FilledButton.tonal(
                  onPressed: () {},
                  child: const Text('Tonal'),
                ),
                const SizedBox(
                  width: Dimensions.xs,
                ),
                FilledButton.tonalIcon(
                  onPressed: () {},
                  label: const Text('Tonal'),
                  icon: const Icon(Icons.abc),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget outlinedButton(BuildContext context) {
    return Card(
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(Dimensions.m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Outlined Button & Outlined Button Icon',
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: Dimensions.xxs,
            ),
            Text(
              'Same with Elevated Button, Outlined Button can be used with '
              'multiple color schemes. Using ExtendedOutlinedButton widget '
              'with same technique .primary, .secondary, and .tertiary',
              style: context.textTheme.bodyMedium,
            ),
            const SizedBox(
              height: Dimensions.m,
            ),
            Row(
              children: [
                ExtendedOutlinedButton.primary(
                  context,
                  onPressed: () {},
                  child: const Text('Primary'),
                ),
                const SizedBox(
                  width: Dimensions.xs,
                ),
                ExtendedOutlinedButton.secondary(
                  context,
                  onPressed: () {},
                  child: const Text('Secondary'),
                ),
                const SizedBox(
                  width: Dimensions.xs,
                ),
                ExtendedOutlinedButton.tertiary(
                  context,
                  onPressed: () {},
                  child: const Text('Tertiary'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
