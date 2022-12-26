abstract class UseCase<T, R> {
  Future<R> build(T data);

  Future<R> execute(T data) async {
    return await build(data).catchError(
      (error) => handleError(error),
    );
  }

  Future<R> handleError(dynamic error);
}
