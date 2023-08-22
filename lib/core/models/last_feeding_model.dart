import 'last_feeding_model.dart';
import 'last_feeding_model.dart';

class LastFeedingModel{
String? message;
LastFeeding? lastFeeding;
LastFeedingModel.fromJson(Map<String,dynamic> json){
message = json['message'];
lastFeeding =  LastFeeding.fromJson(json['meal']);
}
}

class LastFeeding {
String? id;
String? food;
String? date;
String? time;
String? note;
String? babyId;
String? usersId;
LastFeeding.fromJson(Map<String, dynamic> json) {
id = json['id'];
date = json['date'];
time = json['time'];
note = json['note'];
food = json['food'];
babyId = json['babyId'];
usersId = json['usersId'];
}
}