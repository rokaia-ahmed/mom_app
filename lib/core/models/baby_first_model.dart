class BabyFirstModel{
String? message;
BabyFirst? babyFirst;
BabyFirstModel.fromJson(Map<String,dynamic> json){
message = json['message'];
babyFirst =  BabyFirst.fromJson(json['first']);
}
}

class BabyFirst {
String? id;
String? babyFirst;
String? date;
String? note;
String? babyId;
String? usersId;
String? image;
BabyFirst.fromJson(Map<String, dynamic> json) {
id = json['id'];
date = json['date'];
babyFirst = json['babyFirst'];
note = json['note'];
babyId = json['babyId'];
usersId = json['usersId'];
image = json['image'];
}

}