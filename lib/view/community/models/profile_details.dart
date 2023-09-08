import 'all_posts.dart';

class ProfileDetailsModel{
List<Posts> posts=[];
bool? existInFriend ;
Users? user;

ProfileDetailsModel.fromJson(Map<String, dynamic> json){
  json['posts'].forEach((element){
    posts.add(Posts.fromJson(element));
  });
  existInFriend= json['userExistsInFriends'];
  user = Users.fromJson(json['user']);
}

}
class Posts {
  String? id;
  String? userId;
  String? caption;
  String? media;
  String? time;
  bool? isLiked ;
  int ? likeCount;
  int ? commentCount;

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['usersId'];
    caption = json['caption'];
    media = json['media'];
    time = json['time'];
    isLiked = json['userExistsInLikes'];
    likeCount = json['likeCount'];
    commentCount = json['commentCount'];
  }
}