import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is int) {
      return await prefs.setInt(key, value);
    } else if (value is String) {
      return await prefs.setString(key, value);
    } else if (value is double) {
      return await prefs.setDouble(key, value);
    } else {
      return await prefs.setBool(key, value);
    }
  }

  static Future<dynamic> getData({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static Future<void> removeData({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
