import 'package:beyond_docs/common/core/page.dart';

class RouteConfig {
  static List<Page> pages = [
    Page(
      route: '/documentation',
      title: 'Documentation',
      fileName: 'index',
      childrens: [
        Page(
          route: 'architecture',
          title: 'Architecture',
          fileName: 'architecture',
        ),
      ],
    ),
  ];
}
