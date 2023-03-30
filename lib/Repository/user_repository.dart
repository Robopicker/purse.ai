import 'package:purse_ai_app/DataProvider/user_provider.dart';
import 'package:purse_ai_app/Models/post_model.dart';

class UserRepository {
  final provider = UserProvider();
  Future<List<dynamic>> getUserData() async {
    return provider.fetchUser();
  }

  Future<List<PostModel>> getPostData() async {
    return provider.fetchPosts();
  }
}

class NetworkError extends Error {}
