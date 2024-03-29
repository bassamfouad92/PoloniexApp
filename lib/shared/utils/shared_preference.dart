import 'dart:async' show Future;
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {

  static SharedPreferences? _prefsInstance;
  static Future<SharedPreferences> get _instance async => _prefsInstance ?? await SharedPreferences.getInstance();

  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static String getString(String key, {String? defValue}) {
    return _prefsInstance?.getString(key) ?? defValue ?? "";
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs.setBool(key, value);
  }

  static bool getBool(String key) {
    return _prefsInstance?.getBool(key) ?? false;
  }

  static Future<bool> setInt(String key, int value) async {
    var prefs = await _instance;
    return prefs.setInt(key, value);
  }

  static int getInt(String key) {
    return _prefsInstance?.getInt(key) ?? 0;
  }

  static Future<bool> remove(String key) async {
    var prefs = await _instance;
    return prefs.remove(key);
  }

  static Future<bool> clear() async {
    var prefs = await _instance;
    return prefs.clear();
  }

  static Future<void> delete(String key) async {
    await _prefsInstance?.remove(key);
  }
}