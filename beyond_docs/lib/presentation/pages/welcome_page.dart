import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../common/consts/asset_images.dart';

class WelcomePage extends StatelessWidget {
  static const routeName = '/welcome';
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetImages.blogoLight,
              height: 415,
              width: 415,
            ),
            Text(
              'Beyond',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Dart mini framework',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            ElevatedButton(
              child: Text('Get started'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
