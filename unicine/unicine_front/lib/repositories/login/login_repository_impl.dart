import 'package:uni_cine/repositories/login/login_repository.dart';

// Procesos de autenticación por medio de la Api
class LoginRepositoryImpl implements LoginRepository {
  // final ApiBaseHelper _helper = ApiBaseHelper();

  // @override
  // Future<Credentials> signIn(String email, String password) async {
  //   final response = await _helper.post(
  //     Flurorouter.loginRoute,
  //     headers: {HttpHeaders.acceptHeader: 'application/json'},
  //     body: {
  //       'username': email,
  //       'password': password,
  //     },
  //   );
  //   final credentials = Credentials.fromJson(response);
  //   return credentials;
  // }

  // @override
  // Future<void> saveCredentials(Credentials credentials) async {
  //   saveData(
  //       key: CacheKey.token.toString(), data: jsonEncode(credentials.toJson()));
  // }

  // Future<Credentials?> loadCredentials() async {
  //   try {
  //     const storage = FlutterSecureStorage();
  //     final res = await storage.read(key: CacheKey.token.toString());
  //     Map<String, dynamic> json = jsonDecode(res!);
  //     return Credentials.fromJson(json);
  //   } catch (e) {
  //     return null;
  //   }
  // }

  // @override
  // void deleteToken() {
  //   try {
  //     const storage = FlutterSecureStorage();
  //     storage.delete(key: CacheKey.token.toString());
  //   } catch (_) {}
  // }

  // @override
  // Future<String?> loadAuthData() async {
  //   try {
  //     final date = await loadData(CacheKey.dateLogged.toString());
  //     final authDataEncrypted = await loadData(CacheKey.authData.toString());

  //     final key = Key.fromUtf8(date!);
  //     final iv = IV.fromLength(16);

  //     final encrypter = Encrypter(AES(key));
  //     final decrypted = encrypter.decrypt64(authDataEncrypted!, iv: iv);
  //     return decrypted;
  //   } catch (e) {
  //     log(this, 'Error loading load data $e');
  //     return null;
  //   }
  // }

  // @override
  // void saveAuthData(String email, String password) {
  //   final jsonData = jsonEncode({'email': email, 'password': password});
  //   final date = '${DateTime.now()}-key32';
  //   final key = Key.fromUtf8(date);
  //   final iv = IV.fromLength(16);

  //   final encrypter = Encrypter(AES(key));
  //   final encrypted = encrypter.encrypt(jsonData, iv: iv);

  //   saveData(key: CacheKey.authData.toString(), data: encrypted.base64);
  //   saveData(key: CacheKey.dateLogged.toString(), data: date);
  // }

  // @override
  // void saveUsername(String username) {
  //   saveData(key: CacheKey.username.toString(), data: username);
  // }

  // @override
  // Future<String?> loadUsername() async {
  //   final username = await loadData(CacheKey.username.toString());
  //   return username;
  // }
}
