class BaseResponse<T> {
  final T? data;
  final String? message;
  final bool success;

  BaseResponse({this.data, this.message, required this.success});
}
