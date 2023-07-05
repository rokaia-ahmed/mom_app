import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mom_app/network/remote/dioHelper.dart';
import 'package:mom_app/view/Onboarding/api_login/userData.dart';


abstract class ILog{

  Future<userData?> login( String email, String password)async{

    final api='https://children-production.up.railway.app/api/auth/login';
    final data={"email":email,"password":password};
    // return null;
    final dio=Dio();
    Response response;
    response=await dio.post(api,data: data);
    if(response.statusCode==201){
      final body=response.data;
      return userData(Username: email, data: body['user']);
    }
    else
      return null;
  }
}
class LoginService {
  @override
  Future<userData?> login(String email, String password)async{
    try {
      final api = 'https://children-production.up.railway.app/api/auth/login';
      final data = {"email": email, "password": password};

      final dio = Dio();
       final Response response= await DioHelper.postData( data: data, url: api).catchError((error){
         return Response(requestOptions: RequestOptions(path: ''));
       });
      //      .then((value) {
      //
      //
      //    return value;}) .catchError((error){
      //   print("errrrrrrrrrrrrrrrrrrrrorrr ${error}");
      //   return null;
      // });
      // print(" login credentials");
      print(response.statusCode);
      if (response.statusCode == 201) {
        final body = response.data;
        if (body['user'] != null) {
          return userData(Username: email, data: body['user']);
        } else {
          print("API response contained null value for user data");
          // return null;
        }
      } else if (response.statusCode == 400) {
        print("Incorrect login credentials");
        // return userData(Username: "", data: response.data['data']);
      } else {
        print("API request failed with status code ${response.statusCode}");
        return userData(Username: "", data: {});
        // return  userData(Username: "", data: response.data['data']);
      }
    } catch (e) {
      print("An error occurred: $e");
      // return userData(Username: "");
    }
  }
}