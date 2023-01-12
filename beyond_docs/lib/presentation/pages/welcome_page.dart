import 'package:beyond_docs/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import '../../common/consts/asset_images.dart';

class WelcomePage extends StatelessWidget {
  static const routeName = '/welcome';
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(
        double.maxFinite,
        kToolbarHeight,
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
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

  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: LayoutBuilder(
          builder: (context, constrain) {
            return SizedBox(
              width: (constrain.maxWidth / 100) * 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetImages.blogoLight,
                    height: 400,
                    width: 400,
                  ),
                  Text(
                    'Beyond',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Dart mini framework',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(
                                0.5,
                              ),
                        ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    child: const Text('Get started'),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        HomePage.routeName,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Divider(
                    height: 56,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Server',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Easy to setup dart server project, using shelf'
                              ' shelf_routes, and some other packages.',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground
                                        .withOpacity(
                                          0.5,
                                        ),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 48,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Web',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Enjoy develop web project using beyond framework',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground
                                        .withOpacity(
                                          0.5,
                                        ),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 48,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Shared',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Share your model between client and the serveer'
                              ' for more reusability purpose.',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground
                                        .withOpacity(
                                          0.5,
                                        ),
                                  ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const Divider(
                    height: 56,
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Text(
                    'Beyond | Copyright © 2022-present Meruya Technology',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(
                                0.5,
                              ),
                        ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
