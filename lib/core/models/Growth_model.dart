class GrowthModel{
String? message;
GrowthList? growthList;
GrowthModel.fromJson(Map<String,dynamic> json){
message = json['message'];
growthList =  GrowthList.fromJson(json['growth']);
}
}

class GrowthList {
String? id;
String? date;
String? height;
String? weight;
String? babyId;
String? usersId;
String? age;
GrowthList.fromJson(Map<String, dynamic> json) {
id = json['id'];
age = json['age'];
date = json['date'];
height = json['height'];
weight = json['weight'];
babyId = json['babyId'];
usersId = json['usersId'];
}
}