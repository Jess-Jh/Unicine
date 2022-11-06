// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:flutter_meedu/meedu.dart';
// import 'package:flutter_meedu/ui.dart';
// import 'package:uni_cine/repositories/api/Credentials.dart';
// import 'package:uni_cine/repositories/utils/custom_exception.dart';
// import 'package:uni_cine/ui/views/unicine/login/expired_session_view.dart';
// import 'package:uni_cine/utils/util.dart';

// class ApiBaseHelper {
//   final Dio _dio = Dio();

//   Future<dynamic> get(
//     String url, {
//     Map<String, String>? headers,
//     Map<String, String>? queryParameters,
//     CancelToken? cancelToken,
//   }) async {
//     dynamic responseJson;
//     try {
//       final credentials = getCredentials();
//       final response = await _dio.get(
//         url,
//         options: Options(
//           headers: headers ??
//               {
//                 HttpHeaders.contentTypeHeader: 'application/json',
//                 HttpHeaders.acceptHeader: 'application/json',
//                 HttpHeaders.authorizationHeader:
//                     '${credentials.tokenType} ${credentials.accessToken}',
//               },
//         ),
//         queryParameters: queryParameters,
//         cancelToken: cancelToken,
//       );
//       responseJson = _returnResponse(response);
//     } on SocketException {
//       throw FetchDataException('No Internet connection');
//     } on DioError catch (e) {
//       if (e.type == DioErrorType.cancel) {
//         throw AbortException('Request was aborted');
//       }
//       final res = e.response;
//       _returnResponse(
//         Response(
//           statusCode: res?.statusCode,
//           statusMessage: res?.statusMessage,
//           data: res?.data,
//           requestOptions: RequestOptions(path: url),
//         ),
//       );
//     }
//     return responseJson;
//   }

//   Future<dynamic> post(
//     String url, {
//     Map<String, String>? headers,
//     dynamic body,
//     Map<String, dynamic>? queryParameters,
//     CancelToken? cancelToken,
//   }) async {
//     dynamic responseJson;
//     try {
//       Credentials? credentials;
//       if (headers == null) {
//         credentials = getCredentials();
//       }
//       final response = await _dio.post(
//         url,
//         options: Options(
//           headers: headers ??
//               {
//                 HttpHeaders.acceptHeader: 'application/json',
//                 HttpHeaders.authorizationHeader:
//                     '${credentials?.tokenType} ${credentials?.accessToken}',
//               },
//         ),
//         data: body,
//         queryParameters: queryParameters,
//         cancelToken: cancelToken,
//       );
//       responseJson = _returnResponse(response);
//     } on SocketException {
//       throw FetchDataException('No Internet Connection');
//     } on DioError catch (e) {
//       if (e.type == DioErrorType.cancel) {
//         throw AbortException('Request was aborted');
//       }
//       final res = e.response;
//       _returnResponse(Response(
//         statusCode: res?.statusCode,
//         statusMessage: res?.statusMessage,
//         data: res?.data,
//         requestOptions: RequestOptions(path: url),
//       ));
//     }
//     return responseJson;
//   }

//   Future<dynamic> patch(
//     String url, {
//     Map<String, String>? headers,
//     dynamic body,
//     Map<String, dynamic>? queryParameters,
//     CancelToken? cancelToken,
//   }) async {
//     dynamic responseJson;
//     try {
//       final response = await _dio.patch(
//         url,
//         options: Options(headers: headers),
//         data: "$body",
//         queryParameters: queryParameters,
//         cancelToken: cancelToken,
//       );
//       responseJson = _returnResponse(response);
//     } on SocketException {
//       throw FetchDataException('No Internet connection');
//     } on DioError catch (e) {
//       if (e.type == DioErrorType.cancel) {
//         throw AbortException('Request was aborted');
//       }
//       final res = e.response;
//       _returnResponse(
//         Response(
//           statusCode: res?.statusCode,
//           statusMessage: res?.statusMessage,
//           data: res?.data,
//           requestOptions: RequestOptions(path: url),
//         ),
//       );
//     }
//     return responseJson;
//   }

//   Future<dynamic> delete(
//     String url, {
//     Map<String, String>? headers,
//     CancelToken? cancelToken,
//   }) async {
//     Credentials? credentials;
//     if (headers == null) {
//       credentials = getCredentials();
//     }
//     dynamic responseJson;
//     try {
//       final response = await _dio.delete(
//         url,
//         options: Options(
//           headers: headers ??
//               {
//                 HttpHeaders.acceptHeader:
//                     'application/json', // Importante para que salga el Unauthenticated
//                 HttpHeaders.authorizationHeader:
//                     '${credentials?.tokenType} ${credentials?.accessToken}',
//               },
//         ),
//         cancelToken: cancelToken,
//       );
//       responseJson = _returnResponse(response);
//     } on SocketException {
//       throw FetchDataException('No Internet connection');
//     } on DioError catch (e) {
//       log(runtimeType, '${e.error} ${e.message} ${e.response}');
//       if (e.type == DioErrorType.cancel) {
//         throw AbortException('Request was aborted');
//       }
//       final res = e.response;
//       _returnResponse(
//         Response(
//           statusCode: res?.statusCode,
//           statusMessage: res?.statusMessage,
//           data: res?.data,
//           requestOptions: RequestOptions(path: url),
//         ),
//       );
//     }
//     return responseJson;
//   }

//   Credentials getCredentials() {
//     final credentials = Get.find<Credentials>();
//     if (credentials == null) throw UnauthorizedException('Unauthenticated');
//     return credentials;
//   }

//   dynamic _returnResponse(Response response) {
//     switch (response.statusCode) {
//       case 200:
//         if (response.data.runtimeType.toString() == 'String') {
//           final Map<String, dynamic> res = json.decode(response.data);
//           if ('${res['code']}' == '5') {
//             throw PermissionException(res['message']);
//           }
//         }
//         return response.data;
//       case 400:
//         throw BadRequestException(response.data.toString());
//       case 403:
//         // Caso conectado a staging sin vpn
//         if (response.data == 'error code: 1020') {
//           _showExpiredSessionView();
//           throw UnauthorizedException(response.data.toString());
//         }
//         throw PermissionException(response.data.toString());
//       case 401:
//         final data = response.data.toString();
//         if (!(data.contains('invalid_username') ||
//             data.contains('invalid_credentials') ||
//             data.contains('inactive_username'))) {
//           _showExpiredSessionView();
//         }
//         throw UnauthorizedException(response.data.toString());
//       case 500:
//       case 504:
//         throw ServerException(response.data.toString());
//       default:
//         throw FetchDataException(
//             'Error occurred while Communication with Server with StatusCode : ${response.statusCode} ${response.data} ${response.toString}');
//     }
//   }

//   _showExpiredSessionView() {
//     Timer(const Duration(milliseconds: 500), () {
//       try {
//         if (router.settings.name != '/ExpiredSessionPage' &&
//             router.settings.name !=
//                 '/LoginPage' /*router.settings.name != '/'*/) {
//           router.pushReplacement(
//             const ExpiredSessionView(),
//             backGestureEnabled: false,
//             transition: Transition.none,
//           );
//         }
//       } catch (_) {}
//     });
//   }
// }
