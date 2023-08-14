class GetAllGrowthModel {
  String? message;
  List<GrowthMilestones>? growthMilestones;

  GetAllGrowthModel({this.message, List<GrowthMilestones>? growthMilestones})
      : growthMilestones = growthMilestones ?? [];
  GetAllGrowthModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    // print(json['growthMilestones']);
    if (json['growthMilestones'] != null) {
      growthMilestones = [];
      json['growthMilestones'].forEach((v) {
        // final milestone = GrowthMilestones.fromJson(v);
        // print(milestone);
        growthMilestones?.add( GrowthMilestones.fromJson(v));
        print(growthMilestones?[0].height);
        print(growthMilestones?[0].height.runtimeType);
        // print(growthMilestones?[0].height);
      });
    } else {
      growthMilestones = [];
    }
      }
    }
class GrowthMilestones {
  String? id;
  String? date;
  String? weight;
  String? height;
  String? babyId;
  String? age;
  String? usersId;

  GrowthMilestones(
      {this.id,
        this.date,
        this.weight,
        this.height,
        this.babyId,
        this.age,
        this.usersId});

  GrowthMilestones.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    weight = json['weight'].toString();
    height = json['height'].toString();
    babyId = json['babyId'];
    age = json['age'];
    usersId = json['usersId'];
  }
}
