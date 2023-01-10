class Page {
  final String route;
  final String title;
  final String fileName;
  final List<Page>? childrens;

  Page({
    required this.route,
    required this.title,
    required this.fileName,
    this.childrens,
  });
}
