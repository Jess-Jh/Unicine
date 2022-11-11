// import 'package:dio/dio.dart';

// class DioExceptions implements Exception {
//   DioExceptions.fromDioError(DioError dioError) {
//     switch (dioError.type) {
//       case DioErrorType.cancel:
//         message = "Request to API server was cancelled";
//         break;
//       case DioErrorType.connectTimeout:
//         message = "Connection timeout with API server";
//         break;
//       case DioErrorType.receiveTimeout:
//         message = "Receive timeout in connection with API server";
//         break;
//       case DioErrorType.response:
//         message = _handleError(
//             dioError.response!.statusCode!, dioError.response?.data);
//         break;
//       case DioErrorType.sendTimeout:
//         message = "Send timeout in connection with API server";
//         break;
//       default:
//         message = "Something went wrong";
//         break;
//     }
//   }

//   String message = '';

//   String _handleError(int statusCode, dynamic error) {
//     switch (statusCode) {
//       case 400:
//         return 'Bad request';
//       case 404:
//         return error["message"];
//       case 500:
//         return 'Internal server error';
//       default:
//         return 'Oops something went wrong';
//     }
//   }

//   @override
//   String toString() => message;
// }

// class CustomException implements Exception {
//   final dynamic message;
//   final dynamic prefix;

//   CustomException([this.message, this.prefix]);

//   @override
//   String toString() {
//     return "$prefix$message";
//   }
// }

// class UnauthorizedException extends CustomException {
//   UnauthorizedException([message]) : super(message, 'Unauthorized: ');
// }

// class PermissionException extends CustomException {
//   PermissionException([String? message])
//       : super(message, 'Permission Denied: ');
// }

// class BadRequestException extends CustomException {
//   BadRequestException([message]) : super(message, 'Invalid Request: ');
// }

// class ServerException extends CustomException {
//   ServerException([String? message]) : super(message, "Server Error: ");
// }

// class ValidationException extends CustomException {
//   ValidationException([String? message]) : super(message, 'Validation Error: ');
// }

// class FetchDataException extends CustomException {
//   FetchDataException([String? message])
//       : super(message, "Error During Communication: ");
// }

// class AbortException extends CustomException {
//   AbortException([String? message]) : super(message, "AbortException: ");
// }

// class NotFoundException extends CustomException {
//   NotFoundException([String? message]) : super(message, "NorFoundException: ");
// }
