class BabyInfoModel{
  String? message;
  User? user ;

  BabyInfoModel.fromJson(Map<String,dynamic> json){
    message = json['message'];
    user = User.fromJson(json['user']);
  }
}
class User{
  String? id ;
  String? babyName ;
  String? gender ;
  String? birthDate ;
  int? weight ;
  String? image ;
  String? userId ;

  User.fromJson(Map<String,dynamic> json){
    id = json['id'];
    babyName = json['babyName'];
    gender = json['gender'];
    birthDate = json['birthDate'];
    weight = json['weight'];
    image = json['image'];
    userId = json['usersId'];
  }



}