import 'package:dio/dio.dart';
import 'package:uni_cine/services/local_storage.dart';
import 'package:uni_cine/utils/util.dart';

class UnicineApi {
  static final Dio _dio = Dio();

  static void configureDio() {
    // Base Url
    _dio.options.baseUrl = 'http://localhost:8080';

    // Configurar Headers
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''
    };
  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);
      return resp.data;
    } catch (e) {
      log('Error en GET', e);
      rethrow;
    }
  }

  static Future post(String path, dynamic data) async {
    try {
      final resp = await _dio.post(path, data: data);
      return resp.data;
    } catch (e) {
      log('Error en el POST', e);
      rethrow;
    }
  }

  static Future put(String path, dynamic data) async {
    try {
      final resp = await _dio.put(path, data: data);
      return resp.data;
    } catch (e) {
      log('Error en el POST', e);
      rethrow;
    }
  }

  static Future delete(String path, dynamic data) async {
    try {
      final response = await _dio.delete(path, data: data);
      return response.data;
    } catch (e) {
      log('Error en el DELETE', e);
      throw ('No se puede eliminar, ya que tiene una entidad asociada');
    }
  }
}
