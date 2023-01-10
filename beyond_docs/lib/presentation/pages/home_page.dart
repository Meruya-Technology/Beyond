import 'package:beyond_docs/presentation/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/navigation_tile.dart';

class HomePage extends ConsumerWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildNavBar(context, ref),
          buildBody(context),
        ],
      ),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(
        double.maxFinite,
        kToolbarHeight,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.onBackground.withOpacity(
                    0.10,
                  ),
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Beyond.',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              width: 600,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Documentation',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'Beyond CLI',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'GitHub',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildNavBar(BuildContext context, WidgetRef ref) {
    return Container(
      width: 320,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.onBackground.withOpacity(
                  0.10,
                ),
          ),
        ),
      ),
      child: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemBuilder: (context, index) => NavigationTile(
          title: ref.watch(homeProvider).pages[index].title,
        ),
        itemCount: ref.watch(homeProvider).pages.length,
      ),
      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.symmetric(
      //         vertical: 4,
      //       ),
      //       child: Text(
      //         'Documentation',
      //         style: Theme.of(context).textTheme.titleMedium?.copyWith(
      //               fontWeight: FontWeight.bold,
      //             ),
      //       ),
      //     ),
      //     Padding(
      //       padding: EdgeInsets.symmetric(
      //         horizontal: 16,
      //         vertical: 8,
      //       ),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(
      //             'Introduction',
      //             style: Theme.of(context).textTheme.bodyLarge,
      //           ),
      //           SizedBox(height: 8),
      //           Text(
      //             'Geting started',
      //             style: Theme.of(context).textTheme.bodyLarge,
      //           ),
      //           Padding(
      //             padding: EdgeInsets.symmetric(
      //               horizontal: 16,
      //               vertical: 8,
      //             ),
      //             child: Text(
      //               'Installation',
      //               style: Theme.of(context).textTheme.bodyMedium,
      //             ),
      //           ),
      //         ],
      //       ),
      //     )
      //   ],
      // ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: (constraints.maxWidth / 100 * 60),
              child: Text('Body'),
            ),
          );
        },
      ),
    );
  }
}
