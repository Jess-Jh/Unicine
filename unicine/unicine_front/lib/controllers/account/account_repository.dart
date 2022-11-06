import 'package:dio/dio.dart';
import 'package:uni_cine/models/account/user.dart';
import 'package:uni_cine/repositories/api/status_enum.dart';

abstract class AccountRepository {
  Future<User> getCurrentUser({
    CancelToken cancelToken,
  });

  Future<User> getUserProfile({
    dynamic idUser,
    CancelToken cancelToken,
  });

  Future<StatusEnum> saveProfile({
    required Map<String, dynamic> userData,
    bool extra = false,
    CancelToken? cancelToken,
  });
}
