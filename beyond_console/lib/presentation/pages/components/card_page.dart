import 'package:beyond_console/common/const/dimensions.dart';
import 'package:beyond_console/common/extensions/context_extension.dart';
import 'package:beyond_console/presentation/providers/component/card_provider.dart';
import 'package:beyond_console/presentation/widgets/composables/extended_outlined_button.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/composables/bread_crumb.dart';

class CardPage extends ConsumerWidget {
  static const routeName = '/components/card';

  const CardPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(cardProvider);
    return buildBody(context, provider);
  }

  Widget buildBody(BuildContext context, CardProvider provider) {
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
            subTitle: 'Cards',
          ),
          const SizedBox(
            height: Dimensions.m,
          ),
          Row(
            children: [
              smallCard(context),
              const SizedBox(
                width: Dimensions.m,
              ),
              smallCard(context),
              const SizedBox(
                width: Dimensions.m,
              ),
              smallCard(context),
            ],
          ),
          const SizedBox(
            height: Dimensions.m,
          ),
          Row(
            children: [
              basicCard(context),
              const SizedBox(
                width: Dimensions.m,
              ),
              basicCardAction(context),
            ],
          ),
          const SizedBox(
            height: Dimensions.m,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cardWithImage(context),
              const SizedBox(
                width: Dimensions.m,
              ),
              pricingCard(context),
              const SizedBox(
                width: Dimensions.m,
              ),
              pricingCard(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget smallCard(BuildContext context) {
    return Expanded(
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(
            Dimensions.m,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Target',
                    style: context.textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: Dimensions.xxs,
                  ),
                  Text(
                    '\$1,000,000',
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget basicCard(BuildContext context) {
    return Expanded(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(
                Dimensions.m,
              ),
              child: Text(
                'Lorem Ipsum dolor sit amet',
                style: context.textTheme.titleMedium,
              ),
            ),
            const Divider(
              height: 1,
            ),
            const Padding(
              padding: EdgeInsets.all(
                Dimensions.m,
              ),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eu facilisis sed odio morbi quis commodo. Egestas egestas fringilla phasellus faucibus scelerisque eleifend donec.',
              ),
            ),
            const Divider(
              height: 1,
            ),
            const Padding(
              padding: EdgeInsets.all(
                Dimensions.m,
              ),
              child: Text('Lorem Ipsum'),
            ),
          ],
        ),
      ),
    );
  }

  Widget basicCardAction(BuildContext context) {
    return Expanded(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(
                Dimensions.m,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Lorem Ipsum dolor sit amet',
                    style: context.textTheme.titleMedium,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Action'),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
            ),
            const Padding(
              padding: EdgeInsets.all(
                Dimensions.m,
              ),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eu facilisis sed odio morbi quis commodo. Egestas egestas fringilla phasellus faucibus scelerisque eleifend donec.',
              ),
            ),
            const Divider(
              height: 1,
            ),
            const Padding(
              padding: EdgeInsets.all(
                Dimensions.m,
              ),
              child: Text('Lorem Ipsum'),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardWithImage(BuildContext context) {
    return Expanded(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Image.network(
                'https://www.salesforce.com/eu/blog/wp-content/uploads/sites/14/2021/09/crucial-small-business-departments-need-to-succeed.jpg',
                width: double.maxFinite,
                fit: BoxFit.fitWidth,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(
                Dimensions.m,
              ),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eu facilisis sed odio morbi quis commodo. Egestas egestas fringilla phasellus faucibus scelerisque eleifend donec.',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget pricingCard(BuildContext context) {
    return Expanded(
      child: Card(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.m,
            vertical: Dimensions.xl,
          ),
          child: Column(
            children: [
              Text(
                'Premium Membership',
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: Dimensions.m,
              ),
              Text(
                '\$299',
                style: context.textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text('/month  '),
              const SizedBox(
                height: Dimensions.m,
              ),
              ExtendedOutlinedButton.primary(
                context,
                onPressed: () {},
                child: const Text('Get Started'),
              ),
              const SizedBox(
                height: Dimensions.m,
              ),
              const Text(
                'Get access to premium features, by subsciption',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Dimensions.m,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        FeatherIcons.check,
                        size: 16,
                      ),
                      SizedBox(
                        width: Dimensions.xxs,
                      ),
                      Text(
                        'Custom dashboard',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.xs,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        FeatherIcons.check,
                        size: 16,
                      ),
                      SizedBox(
                        width: Dimensions.xxs,
                      ),
                      Text(
                        'Messanging Apps',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.xs,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        FeatherIcons.check,
                        size: 16,
                      ),
                      SizedBox(
                        width: Dimensions.xxs,
                      ),
                      Text(
                        'Push Notifications',
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
