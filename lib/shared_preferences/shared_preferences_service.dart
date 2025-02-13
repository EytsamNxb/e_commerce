import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static late SharedPreferences _preferences;

  SharedPreferencesService._();

  static Future<SharedPreferencesService> getInstance() async {
    _instance ??= SharedPreferencesService._();
    _preferences = await SharedPreferences.getInstance();

    return _instance!;
  }

  // Members
  String get token => _getValue("token") ?? "";
  set token(String token) => _savaData(token, "token");
  
  
  
  // Private methods
  dynamic _getValue(String key) {
    var value = _preferences.get(key);
    debugPrint('Retrieved $key: $value');
    return value;
  }

  void _savaData(dynamic value, String key) {
    debugPrint('Saving $key: $value');
    if (value is String) {
      _preferences.setString(key, value);
    } else if (value is int) {
      _preferences.setInt(key, value);
    } else if (value is double) {
      _preferences.setDouble(key, value);
    } else if (value is bool) {
      _preferences.setBool(key, value);
    } else if (value is List<String>) {
      _preferences.setStringList(key, value);
    }
  }
}
