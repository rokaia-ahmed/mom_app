class MedicalDocumentModel{
String? message;
MedicalDocument? medicalDocument;
MedicalDocumentModel.fromJson(Map<String,dynamic> json){
message = json['message'];
medicalDocument =  MedicalDocument.fromJson(json['document']);
}
}

class MedicalDocument {
String? id;
String? document;
String? babyId;
String? usersId;
MedicalDocument.fromJson(Map<String, dynamic> json) {
id = json['id'];
document = json['document'];
babyId = json['babyId'];
usersId = json['usersId'];
}
}