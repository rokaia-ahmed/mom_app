import 'dart:convert';

import 'package:mom_app/core/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/app_strings.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

//************************

  static LoginModel? getData() {
    LoginModel? userData;
    String? data = sharedPreferences.getString(AppStrings.userData);
    if (data != null) {
      userData = LoginModel.fromJson(jsonDecode(data));
    }
    return userData;
  }

  static addBaby(String id) {
    List<String> list =
        sharedPreferences.getStringList(AppStrings.babyDate) ?? [];
    list.add(id);
    sharedPreferences.setStringList(AppStrings.babyDate, list);
  }

  static bool haveBaby() {
    List<String> list =
        sharedPreferences.getStringList(AppStrings.babyDate) ?? [];
    return list.isNotEmpty;
  }
  //*********************

  static saveData({
    required String key,
    required dynamic value,
  }) async {
    String user = jsonEncode(value);
    sharedPreferences.setString(key, user);
  }

  //************************
  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }
}
