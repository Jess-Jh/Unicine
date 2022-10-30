class CustomException implements Exception {
  final dynamic message;
  final dynamic prefix;

  CustomException([this.message, this.prefix]);

  @override
  String toString() {
    return "$prefix$message";
  }
}

class UnauthorizedException extends CustomException {
  UnauthorizedException([message]) : super(message, 'Unauthorized: ');
}

class PermissionException extends CustomException {
  PermissionException([String? message])
      : super(message, 'Permission Denied: ');
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, 'Invalid Request: ');
}

class ServerException extends CustomException {
  ServerException([String? message]) : super(message, "Server Error: ");
}

class FetchDataException extends CustomException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class AbortException extends CustomException {
  AbortException([String? message]) : super(message, "AbortException: ");
}
