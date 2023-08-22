class GetAllMedicalHistoryModel {
  String? message;
  List<MedicalRecords>? medicalRecords;

  GetAllMedicalHistoryModel({this.message, List<MedicalRecords>? medicalRecords})
      : medicalRecords = medicalRecords ?? [];
  GetAllMedicalHistoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    // print(json['growthMilestones']);
    if (json['medicalHistory'] != null) {
      medicalRecords = [];
      json['medicalHistory'].forEach((v) {
        // final milestone = GrowthMilestones.fromJson(v);
        // print(milestone);
        medicalRecords?.add( MedicalRecords.fromJson(v));
        // print(growthMilestones?[0].height);
        // print(growthMilestones?[0].height.runtimeType);
        // print(growthMilestones?[0].height);
      });
    } else {
      medicalRecords = [];
    }
      }
    }
class MedicalRecords {
  String? id;
  String? date;
  String? diagnosis;
  String? doctorName;
  String? babyId;
  String? age;
  String? usersId;

  MedicalRecords(
      {this.id,
        this.date,
        this.diagnosis,
        this.doctorName,
        this.babyId,
        this.age,
        this.usersId});

  MedicalRecords.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    diagnosis = json['diagnosis'];
    doctorName = json['doctorName'];
    babyId = json['babyId'];
    age = json['age'];
    usersId = json['usersId'];
  }
}
