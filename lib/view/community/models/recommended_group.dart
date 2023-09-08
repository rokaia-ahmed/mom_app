class RecommendedGroupModel{
  String? id;
  String? groupName;
  String? founder;
  String? image;
  String? cover;
  int? count;

  RecommendedGroupModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupName = json['groupName'];
    founder = json['founder'];
    image = json['image'];
    cover = json['cover'];
    count = json['count'];
  }
}