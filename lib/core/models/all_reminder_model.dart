import 'package:flutter/foundation.dart';

class GetAllReminderModel {
  String? message;
  List<Reminders>? reminders;

  GetAllReminderModel({this.message, List<Reminders>? reminders})
      : reminders = reminders ?? [];

  GetAllReminderModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];

    if (json['reminders'] != null) {
      reminders = [];
      json['reminders'].forEach((v) {
        reminders?.add(new Reminders.fromJson(v));
      });
    } else {
      reminders = [];
    }
  }
}
class Reminders {
  String? id;
  String? date;
  String? time;
  String? note;
  String? babyId;
  String? usersId;
  Reminders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    time = json['time'];
    note = json['note'];
    babyId = json['babyId'];
    usersId = json['usersId'];
  }

}