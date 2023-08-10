import 'package:flutter/foundation.dart';

class GetAllActivityModel {
  String? message;
  List<Activities>? activities;

  GetAllActivityModel({this.message, List<Activities>? activities})
      : activities = activities ?? [];

  GetAllActivityModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];

    if (json['activities'] != null) {
      activities = [];
      json['activities'].forEach((v) {
        activities?.add(new Activities.fromJson(v));
      });
    } else {
      activities = [];
    }
  }
}
class Activities {
  String? id;
  String? activity;
  String? date;
  String? time;
  String? note;
  String? babyId;
  String? usersId;
  Activities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    activity = json['activity'];
    date = json['date'];
    time = json['time'];
    note = json['note'];
    babyId = json['babyId'];
    usersId = json['usersId'];
  }

}