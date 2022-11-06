

// class RegisterRepositoryImpl implements RegisterRepository {
  // final ApiBaseHelper _helper = ApiBaseHelper();
  // final String _baseUrl = 'http://localhost:8080';

  // @override
  // Future<Client> registerClient({required Client client}) async {
  //   final res = await _helper.post(
  //     '$_baseUrl/auth/register',
  //     body: client.toJson(),
  //   );
  //   final data = res.runtimeType == String ? json.decode(res.toString()) : res;
  //   if (data['status'] == 'success') {
  //     return Client.fromJson(data);
  //   }
  //   if ('${data['code']}' == '2') {
  //     throw ValidationException(data['message']);
  //   }
  //   throw res;
  // }
// }
