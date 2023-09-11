
import 'package:mom_app/view/community/models/profile_details.dart';

import 'my_groups.dart';

class GroupDetailsModel{
  Group? group ;
  bool? existInGroup ;
  List<Posts> posts=[];

  GroupDetailsModel.fromJson(Map<String, dynamic> json) {
    group = Group.fromJson(json['group']);
    existInGroup = json['userExistsInGroup'];
    json['posts'].forEach((element){
      posts.add(Posts.fromJson(element));
    });
  }
}