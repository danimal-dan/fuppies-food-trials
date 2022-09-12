import 'package:shared_preferences/shared_preferences.dart';

class AuthCredentialProvider {
  static const String _credentialsKey = 'fuppies_credentials';

  static Future<bool> hasCredentials() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.containsKey(_credentialsKey);
  }

  static Future<String?> getCredentials() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(_credentialsKey);
  }

  static Future<void> setCredentials(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_credentialsKey, "$username:$password");
  }

  static Future<void> reset() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_credentialsKey);
  }
}
