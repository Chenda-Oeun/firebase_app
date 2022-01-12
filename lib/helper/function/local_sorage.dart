import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<void> storeStrings(
      {required String key, required String value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String> getStrings({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString(key) ?? "";
    return uid;
  }

  static Future<void> onRemoveString({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
