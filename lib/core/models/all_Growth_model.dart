class GetAllGrowthModel {
  String? message;
  List<GrowthMilestones>? growthMilestones;

  GetAllGrowthModel({this.message, List<GrowthMilestones>? growthMilestones})
      : growthMilestones = growthMilestones ?? [];

  GetAllGrowthModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];

    if (json['growthMilestones'] != null) {
      growthMilestones = [];
      json['growthMilestones'].forEach((v) {
        growthMilestones?.add(new GrowthMilestones.fromJson(v));
      });
    } else {
      growthMilestones = [];
    }
      }
    }
class GrowthMilestones {
  String? id;
  String? date;
  int? weight;
  double? height;
  String? babyId;
  String? age;
  String? usersId;

  GrowthMilestones.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    weight = json['weight'];
    height = json['height'];
    babyId = json['babyId'];
    age = json['age'];
    usersId = json['usersId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['babyId'] = this.babyId;
    data['age'] = this.age;
    data['usersId'] = this.usersId;
    return data;
  }
}
