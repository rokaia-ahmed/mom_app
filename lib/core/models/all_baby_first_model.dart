import 'package:flutter/foundation.dart';

class GetAllBabyFirstModel {
  String? message;
  List<Firsts>? firsts;

  GetAllBabyFirstModel({this.message, List<Firsts>? firsts})
      : firsts = firsts ?? [];

  GetAllBabyFirstModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];

    if (json['firsts'] != null) {
      firsts = [];
      json['firsts'].forEach((v) {
        firsts?.add(new Firsts.fromJson(v));
      });
    } else {
      firsts = [];
    }
  }
}
class Firsts {
  String? id;
  String? babyFirst;
  String? date;
  String? image;
  String? note;
  String? babyId;
  String? usersId;
  Firsts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    babyFirst = json['babyFirst'];
    date = json['date'];
    image = json['image'];
    note = json['note'];
    babyId = json['babyId'];
    usersId = json['usersId'];
  }
}