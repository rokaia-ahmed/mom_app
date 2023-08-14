import 'package:flutter/foundation.dart';

class GetAllBabyFirstModel {
  String? message;
  List<Firsts>? firsts;

  // GetAllBabyFirstModel({this.message, List<Firsts>? firsts})
  //     : firsts = firsts ?? [];

  GetAllBabyFirstModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    print(message);
    if (json['firsts'] != null) {

      firsts = [];
      json['firsts'].forEach((v) {
        print(v);
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
    date = json['date'];
    babyFirst = json['babyFirst'];
    note = json['note'];
    babyId = json['babyId'];
    usersId = json['usersId'];
    image = json['image'];
  }
}