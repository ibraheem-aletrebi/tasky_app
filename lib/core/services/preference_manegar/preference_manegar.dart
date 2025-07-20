import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManegar {
  static final PreferenceManegar _instance = PreferenceManegar._internals();

  factory PreferenceManegar() {
    return _instance;
  }

  late final SharedPreferences _preferences;

  init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<bool> setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  String? getString(String key) {
    return _preferences.getString(key);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }

  bool? getBool(String key) {
    return _preferences.getBool(key);
  }

  Future<bool> remove(String key) async {
    return await _preferences.remove(key);
  }

  void clear() {
    _preferences.clear();
  }

  PreferenceManegar._internals();
}
