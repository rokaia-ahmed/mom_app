import 'last_feeding_model.dart';
import 'last_feeding_model.dart';

class LastFeedingModel{
String? message;
LastFeeding? lastFeeding;
LastFeedingModel.fromJson(Map<String,dynamic> json){
message = json['message'];
lastFeeding =  LastFeeding.fromJson(json['lastFeeding']);
}
}

class LastFeeding {
String? id;
String? activity;
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
babyId = json['babyId'];
usersId = json['usersId'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['activity'] = this.activity;
data['date'] = this.date;
data['time'] = this.time;
data['note'] = this.note;
data['babyId'] = this.babyId;
data['usersId'] = this.usersId;
return data;
}
}