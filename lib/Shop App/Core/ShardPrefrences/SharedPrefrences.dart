import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrences {
  static SharedPreferences? sharedPreferences;

  /// Initial ///

  static Future<SharedPreferences?> sharedPref() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences;
  }

  /// Set Data ///

  static Future<bool> setData({required String key, required var value}) async {
    if (value is bool)
      return sharedPreferences!.setBool(key, value);
    else if (value is int)
      return sharedPreferences!.setInt(key, value);
    else if (value is double)
      return sharedPreferences!.setDouble(key, value);
    else if (value is String)
      return sharedPreferences!.setString(key, value);
    else
      return sharedPreferences!.setStringList(key, value);
  }

  /// Get String ///

  static String? getStringData({required String key}) {
    return sharedPreferences?.getString(key);
  }

  /// Get int ///
  static int? getIntData({required String key}) {
    return sharedPreferences?.getInt(key);
  }

  /// Get bool ///
  static bool? getBoolData({required String key}) {
    return sharedPreferences?.getBool(key);
  }

  /// Get double ///
  static double? getDoubleData({required String key}) {
    return sharedPreferences?.getDouble(key);
  }
}
