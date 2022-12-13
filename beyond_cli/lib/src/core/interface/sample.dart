abstract class Sample {
  String path;
  bool ovewrite;
  String get content;

  Sample(
    this.path, {
    this.ovewrite = false,
  });
}
