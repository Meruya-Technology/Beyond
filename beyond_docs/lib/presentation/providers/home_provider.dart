import 'package:beyond_docs/common/configs/route_config.dart';
import 'package:beyond_docs/common/core/page.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/utils/markdown_util.dart';

class HomeProvider extends ChangeNotifier {
  List<Page> get pages => RouteConfig.pages;
  Future<String?> get bodyMarkdown async => await MarkdownUtil.retrieveMarkdown(
        'architecture',
      );

  void changePage(Page page) {
    MarkdownUtil.retrieveMarkdown(
      page.fileName,
    );
  }
}

final homeProvider = ChangeNotifierProvider<HomeProvider>(
  (ref) => HomeProvider(),
);
