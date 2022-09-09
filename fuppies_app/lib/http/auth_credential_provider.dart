import 'package:shared_preferences/shared_preferences.dart';

class AuthCredentialProvider {
  static const String _tokenKey = 'fuppies_token';

  static Future<bool> hasToken() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.containsKey(_tokenKey);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(_tokenKey);
  }

  static Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_tokenKey, token);
  }

  static Future<void> reset() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_tokenKey);
  }
}
