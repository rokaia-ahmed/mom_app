class GetAllMedicalDocumentModel {
  String? message;
  List<MedicalDocument>? medicalDocument;

  GetAllMedicalDocumentModel({this.message, List<MedicalDocument>? medicalRecords})
      : medicalDocument = medicalRecords ?? [];
  GetAllMedicalDocumentModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    // print(json['growthMilestones']);
    if (json['allDocuments'] != null) {
      medicalDocument = [];
      json['allDocuments'].forEach((v) {
        // final milestone = GrowthMilestones.fromJson(v);
        // print(milestone);
        medicalDocument?.add( MedicalDocument.fromJson(v));
        // print(growthMilestones?[0].height);
        // print(growthMilestones?[0].height.runtimeType);
        // print(growthMilestones?[0].height);
      });
    } else {
      medicalDocument = [];
    }
      }
    }
class MedicalDocument {
  String? id;
  String? document;
  String? babyId;
  String? usersId;

  MedicalDocument(
      {this.id,
        this.document,
        this.babyId,
        this.usersId});

  MedicalDocument.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    document = json['document'];
    babyId = json['babyId'];
    usersId = json['usersId'];
  }
}
