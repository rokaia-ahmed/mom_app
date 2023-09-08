class MyGroupsModel {
  String? message;
  List<Groups>? groups;

  MyGroupsModel({this.message, required this.groups});

  MyGroupsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    groups =  (json["groups"] as List).map((e) => Groups.fromJson(e)).toList();
  }

}

class Groups {
  String? id;
  String? usersId;
  String? groupId;
  Group? group;

  Groups({this.id, this.usersId, this.groupId, this.group});

  Groups.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usersId = json['usersId'];
    groupId = json['groupId'];
    group =   Group.fromJson(json['group']);
  }

}

class Group {
  String? id;
  String? groupName;
  String? founder;
  String? image;
  String? cover;
  int? count;

  Group({this.id, this.groupName, this.founder,this.image,this.cover});

  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupName = json['groupName'];
    founder = json['founder'];
    image = json['image'];
    cover = json['cover'];
    count = json['count'];
  }


}
