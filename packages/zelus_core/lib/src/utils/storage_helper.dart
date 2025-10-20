import 'package:shared_preferences/shared_preferences.dart';

/// Local storage helper using SharedPreferences
class StorageHelper {
  static SharedPreferences? _prefs;

  /// Initialize storage
  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  /// Get string value
  static Future<String?> getString(String key) async {
    await init();
    return _prefs?.getString(key);
  }

  /// Set string value
  static Future<bool> setString(String key, String value) async {
    await init();
    return await _prefs?.setString(key, value) ?? false;
  }

  /// Get int value
  static Future<int?> getInt(String key) async {
    await init();
    return _prefs?.getInt(key);
  }

  /// Set int value
  static Future<bool> setInt(String key, int value) async {
    await init();
    return await _prefs?.setInt(key, value) ?? false;
  }

  /// Get bool value
  static Future<bool?> getBool(String key) async {
    await init();
    return _prefs?.getBool(key);
  }

  /// Set bool value
  static Future<bool> setBool(String key, bool value) async {
    await init();
    return await _prefs?.setBool(key, value) ?? false;
  }

  /// Get double value
  static Future<double?> getDouble(String key) async {
    await init();
    return _prefs?.getDouble(key);
  }

  /// Set double value
  static Future<bool> setDouble(String key, double value) async {
    await init();
    return await _prefs?.setDouble(key, value) ?? false;
  }

  /// Get string list
  static Future<List<String>?> getStringList(String key) async {
    await init();
    return _prefs?.getStringList(key);
  }

  /// Set string list
  static Future<bool> setStringList(String key, List<String> value) async {
    await init();
    return await _prefs?.setStringList(key, value) ?? false;
  }

  /// Remove key
  static Future<bool> remove(String key) async {
    await init();
    return await _prefs?.remove(key) ?? false;
  }

  /// Clear all data
  static Future<bool> clear() async {
    await init();
    return await _prefs?.clear() ?? false;
  }

  /// Check if key exists
  static Future<bool> containsKey(String key) async {
    await init();
    return _prefs?.containsKey(key) ?? false;
  }
}

