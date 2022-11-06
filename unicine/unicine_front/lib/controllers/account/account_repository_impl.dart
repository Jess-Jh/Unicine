// import 'package:dio/src/cancel_token.dart';
// import 'package:uni_cine/controllers/account/account_repository.dart';
// import 'package:uni_cine/repositories/api/api_base_helper.dart';
// import 'package:uni_cine/repositories/api/status_enum.dart';
// import 'package:uni_cine/models/account/user.dart';
// import 'package:uni_cine/router/router.dart';

// class AccountRepositoryImpl implements AccountRepository {
//   final ApiBaseHelper _helper = ApiBaseHelper();

//   @override
//   Future<User> getCurrentUser({CancelToken? cancelToken}) async {
//     final response = await _helper.get(Flurorouter.userDetailsRoute);

//     final userDetailsRoute = User.fromJson(response);
//     return userDetailsRoute;
//   }

//   @override
//   Future<User> getUserProfile({idUser, CancelToken? cancelToken}) {
//     // TODO: implement getUserProfile
//     throw UnimplementedError();
//   }

//   @override
//   Future<StatusEnum> saveProfile(
//       {required Map<String, dynamic> userData,
//       bool extra = false,
//       CancelToken? cancelToken}) {
//     // TODO: implement saveProfile
//     throw UnimplementedError();
//   }
// }
