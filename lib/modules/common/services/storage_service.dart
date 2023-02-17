import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  StorageService(this.instance);
  final SharedPreferences instance;
  Future<bool> setData(String key, value, {bool serialize = true}) async {
    if (serialize) {
      value = jsonEncode(value);
    }
    return await instance.setString(key, value);
  }

  Future<Map<String, dynamic>?> getData(key) async {
    var result = instance.getString(key);
    if (result == null) {
      return null;
    }
    return jsonDecode(result);
  }

  Future<bool> setBool(
    String key,
    bool value,
  ) async {
    return instance.setBool(key, value);
  }

  Future<bool> getBool(
    String key,
  ) async {
    return instance.getBool(key) ?? false;
  }

  Future<String?> getString(key) async {
    var result = instance.getString(key);
    return result;
  }

  Future<bool> setDataTimmed(
    String key,
    value, {
    Duration time = const Duration(minutes: 10),
    bool serialize = true,
  }) async {
    if (value == null) return false;
    var response = await setData(key, value, serialize: serialize);
    await setData("$key-timmed", DateTime.now().add(time).toString(),
        serialize: false);
    return response;
  }

  Future<Map<String, dynamic>?> getDataTimmed(key) async {
    try {
      var keyTimmed = "$key-timmed";
      if (!await existsKey(keyTimmed)) {
        throw Exception();
      }
      var isValidUntil = await getString(keyTimmed);
      if (isValidUntil == null) {
        return null;
      }
      var currentDate = DateTime.now();
      var isValidCache = DateTime.parse(isValidUntil).isAfter(currentDate);
      if (!isValidCache) {
        return null;
      }
      var responseData = await getData(key);
      return responseData;
    } catch (e) {
      dropKey("$key-timmed");
      return null;
    }
  }

  Future<String?> getStringTimmed(key) async {
    var keyTimmed = "$key-timmed";
    if (!await existsKey(keyTimmed)) {
      return null;
    }
    var isValidUntil = await getString(keyTimmed);
    if (isValidUntil == null) {
      return null;
    }
    var currentDate = DateTime.now();
    var isValidCache = DateTime.parse(isValidUntil).isAfter(currentDate);
    if (!isValidCache) {
      return null;
    }
    var responseData = getString(key);
    return responseData;
  }

  Future<bool> existsKey(key) async {
    return instance.containsKey(key);
  }

  Future<bool> dropKey(key) async {
    return await instance.remove(key);
  }

  Future<bool> clearAll() async {
    return await instance.clear();
  }
}
