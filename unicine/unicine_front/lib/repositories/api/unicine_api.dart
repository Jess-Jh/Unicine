import 'package:dio/dio.dart';
import 'package:uni_cine/services/local_storage.dart';

class UnicineApi {
  static final Dio _dio = Dio();

  static void configureDio() {
    // Base Url
    _dio.options.baseUrl = 'http://localhost:8080';

    // Configurar Headers
    _dio.options.headers = {
      'jwttoken': LocalStorage.prefs.getString('token') ?? '',
      'Authorization': 'Basic YWRtaW4yQGdtYWlsLmNvbToxMjM=',
      // 'Accept': 'application/json',
      'content-type': 'application/json',
      // "Access-Control_Allow_Origin": "*",
      // "Access-Control-Allow-Credentials": true,
      // 'Access-Control-Allow-Methods': 'GET , POST'
    };
  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);
      return resp.data;
    } on DioError catch (e) {
      throw (e.response?.data['error']);
    }
  }

  static Future post(String path, dynamic data) async {
    try {
      final resp = await _dio.post(path, data: data);
      return resp.data;
    } on DioError catch (e) {
      throw (e.response?.data['error']);
    }
  }

  static Future put(String path, dynamic data) async {
    try {
      final resp = await _dio.put(path, data: data);
      return resp.data;
    } on DioError catch (e) {
      throw (e.response?.data['error']);
    }
  }

  static Future delete(String path, dynamic data) async {
    try {
      final response = await _dio.delete(path, data: data);
      return response.data;
    } on DioError catch (e) {
      throw (e.response?.data['error']);
    }
  }
}
