import 'package:beyond_docs/presentation/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationRail(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            indicatorColor: Theme.of(context).colorScheme.primary,
            extended: true,
            onDestinationSelected: (value) {},
            destinations: [
              NavigationRailDestination(
                padding: EdgeInsets.all(0),
                icon: Icon(
                  Icons.home_filled,
                ),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: Text('Home 2'),
              ),
            ],
            selectedIndex: 0,
          ),
          Expanded(
            child: Container(
              child: Text('Body'),
            ),
          ),
        ],
      ),
    );
  }
}
