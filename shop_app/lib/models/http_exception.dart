class HttpException implements Exception {
  final String message;
  HttpException(this.message);

  @override
  String toString() {
    return message;
    //return super.toString(); //Instance of HttpException
    //toString is available to every class as it is present in Object class
  }
}
