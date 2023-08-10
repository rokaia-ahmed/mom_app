import 'package:flutter/foundation.dart';

class GetAllMealModel {
  String? message;
  List<Meals>? meals;

  GetAllMealModel({this.message, List<Meals>? meals})
      : meals = meals ?? [];

  GetAllMealModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];

    if (json['meals'] != null) {
      meals = [];
      json['meals'].forEach((v) {
        meals?.add(new Meals.fromJson(v));
      });
    } else {
      meals = [];
    }
  }
}
class Meals {
  String? id;
  String? food;
  String? date;
  String? time;
  String? note;
  String? babyId;
  String? usersId;
  Meals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    food = json['food'];
    date = json['date'];
    time = json['time'];
    note = json['note'];
    babyId = json['babyId'];
    usersId = json['usersId'];
  }

}