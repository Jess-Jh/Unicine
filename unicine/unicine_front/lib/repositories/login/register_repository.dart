import 'package:uni_cine/models/client/client.dart';

abstract class RegisterRepository {
  Future<Client> registerClient({required Client client});
}
