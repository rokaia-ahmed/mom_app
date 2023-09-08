class AllPostsModel{
  String? id;
  String? userId;
  String? caption;
  String? media;
  String? time;
  int ? likeCount;
  bool ? isLiked;
  int ? commentCount;
  Users ? users;


  AllPostsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['usersId'];
    caption = json['caption'];
    media = json['media'];
    time = json['time'];
    likeCount = json['likeCount'];
    isLiked = json['userExistsInLikes'];
    commentCount = json['commentCount'];
    users = Users.fromJson(json['Users']);
  }
}

class Users{
  String? id;
  String? firstName;
  String? lastName;
  String? image;
  String? cover;

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstname'];
    lastName = json['lastname'];
    image = json['image'];
    cover = json['cover'];
  }
}