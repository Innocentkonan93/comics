class HTTPResponse<T> {
  bool isSuccesful;
  T data;
  String message;
  int responseCode;
  HTTPResponse(
    this.isSuccesful,
    this.data, {
    this.message,
    this.responseCode,
  });
}
