class RequestFriendModel{
  String? id;
  String? user1Id;
  String? user2Id;

  RequestFriendModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user1Id = json['user1Id'];
    user2Id = json['user2Id'];
  }
}