import 'package:purse_ai_app/DataProvider/user_provider.dart';

class UserRepository {
  final provider = UserProvider();
  Future<List<dynamic>> getUserData() async {
    return provider.fetchUser();
  }
}

class NetworkError extends Error {}
