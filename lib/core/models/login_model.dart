import 'baby_info_model.dart';

class LoginModel {
  String? id;
  String? firstname;
  String? lastname;
  String? email;
  String? message;
  String? accessToken;
  String? refreshToken;
  List<User> baby = [];

  LoginModel({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.accessToken,
    this.refreshToken,
    this.message,
    required this.baby,
  });
  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    message = json['message'];
    baby = List.from(json['baby']).map((e) => User.fromJson(e)).toList();
  }
}
