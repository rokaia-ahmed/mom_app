class MedicalHistoryModel{
String? message;
MedicalHistory? medicalHistory;
MedicalHistoryModel.fromJson(Map<String,dynamic> json){
message = json['message'];
medicalHistory =  MedicalHistory.fromJson(json['medicalHistory']);
}
}

class MedicalHistory {
String? id;
String? date;
String? diagnosis;
String? doctorName;
String? babyId;
String? usersId;
String? age;
MedicalHistory.fromJson(Map<String, dynamic> json) {
id = json['id'];
age = json['age'];
date = json['date'];
doctorName = json['doctorName'];
diagnosis = json['diagnosis'];
babyId = json['babyId'];
usersId = json['usersId'];
}
}