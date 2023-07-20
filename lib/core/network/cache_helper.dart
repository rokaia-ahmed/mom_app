

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';
import '../utils/app_strings.dart';

class CacheHelper {


  static late SharedPreferences sharedPreferences;

  static init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }



//************************


  static UserModel? getData()
   {
     UserModel? userData;
    String? data = sharedPreferences.getString(AppStrings.userData);
    if(data !=null){
      userData =  UserModel.fromJson(jsonDecode(data));
    }
    return userData;
  }


  //*********************

  static saveData ({
    required String key ,
    required dynamic value ,
}) async
  {
    String user = jsonEncode(value);
     sharedPreferences.setString(key,user);
  }
  //************************
  static Future<bool> removeData(
      {required String key})async{
   return await sharedPreferences.remove(key);
  }

}