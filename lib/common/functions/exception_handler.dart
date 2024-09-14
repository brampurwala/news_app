import '../resources/app_strings.dart';

class ResponseMessage {
  static const String NO_INTERNET_CONNECTION = "No Internet connection";
}

class  Failure {
  int code; // 200 or 400
  String message; // error or success

  Failure({required this.code, this.message = AppStrings.global_empty_string});
}

class ResponseCode {
  static const int DEFAULT = -1;
  static const int NO_INTERNET_CONNECTION = -7;
}

class AppExceptions implements Exception {
  late Failure failure;

  AppExceptions.handle({required Failure caughtFailure}) {
    if (caughtFailure.code == ResponseCode.NO_INTERNET_CONNECTION) {
      caughtFailure.message = AppStrings.global_noInternet_text;
      failure = caughtFailure;
    } else if (caughtFailure.code == ResponseCode.DEFAULT) {
      failure = caughtFailure;
    } else {
      failure = caughtFailure;
    }
  }
}