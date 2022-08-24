import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleStorageManager {
  static LocaleStorageManager instance = LocaleStorageManager();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> containsKey(String key) async {
    SharedPreferences prefs = await _prefs;
    return prefs.containsKey(key);
  }

  Future<Set<String>> getKeys() async {
    SharedPreferences prefs = await _prefs;
    return prefs.getKeys();
  }

  Future<T?> get<T>(String key) async {
    SharedPreferences prefs = await _prefs;
    if (prefs.containsKey(key))
      switch (T) {
        case String:
          return prefs.getString(key) as T;
        case int:
          return prefs.getInt(key) as T;
        case bool:
          return prefs.getBool(key) as T;
        case double:
          return prefs.getDouble(key) as T;
        case List<String>:
          return prefs.getStringList(key) as T;
        default:
          return null;
      }
    return null;
  }

  Future<bool> set<T>(String key, T value) async {
    SharedPreferences prefs = await _prefs;
    switch (T) {
      case String:
        return await prefs.setString(key, value as String);
      case int:
        return await prefs.setInt(key, value as int);
      case bool:
        return await prefs.setBool(key, value as bool);
      case double:
        return await prefs.setDouble(key, value as double);
      case List<String>:
        return await prefs.setStringList(key, value as List<String>);
      default:
        return false;
    }
  }

  Future<bool> remove(String key) async {
    SharedPreferences prefs = await _prefs;
    return await prefs.remove(key);
  }

  Future<bool> putObjectList(String key, List<Object> list) async {
    List<String> dataList = list.map((value) {
      return json.encode(value);
    }).toList();
    return set<List<String>>(key, dataList);
  }

  Future<List<T>> getObjList<T>(String key, T Function(Map v) f, {List<T> defValue = const []}) async {
    List<Map>? dataList = await _getObjectList(key);
    List<T>? list = dataList?.map((value) {
      return f(value);
    }).toList();
    return list ?? defValue;
  }

  Future<List<Map>?> _getObjectList(String key) async {
    SharedPreferences prefs = await _prefs;
    List<String>? dataList = prefs.getStringList(key);
    return dataList?.map((value) {
      Map dataMap = json.decode(value);
      return dataMap;
    }).toList();
  }
}
