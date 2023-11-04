import 'package:fic9_ecommerce_app/data/model/response/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasource {
  // save auth data
  Future<void> saveAuthData(AuthResponseModel model) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth', model.toJson());
  }

  // remove auth data
  Future<void> removeAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth');
  }

  // get token
  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final authJson = prefs.getString('auth') ?? '';
    final authData = AuthResponseModel.fromJson(authJson);
    return authData.jwt ?? '';
  }

  // user
  Future<User> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final authJson = prefs.getString('auth') ?? '';
    final authData = AuthResponseModel.fromJson(authJson);
    return authData.user!;
  }

  // check login or not
  Future<bool> isLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final authJson = prefs.getString('auth') ?? '';
    return authJson.isNotEmpty;
  }
}
