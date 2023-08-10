class ActivityModel{
String? message;
Activity? activity;
ActivityModel.fromJson(Map<String,dynamic> json){
message = json['message'];
activity =  Activity.fromJson(json['activity']);
}
}

class Activity {
String? id;
String? activity;
String? date;
String? time;
String? note;
String? babyId;
String? usersId;
Activity.fromJson(Map<String, dynamic> json) {
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