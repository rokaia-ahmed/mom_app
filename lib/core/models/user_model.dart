class UserModel {
  String? id;
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  Tokens? tokens;
  String? message;

  UserModel({this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.password,
    this.tokens,
    this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    password = json['password'];
    tokens =
    json['tokens'] != null ? Tokens.fromJson(json['tokens']) : null;
    message = json['message'];
  }
}
  class Tokens {
  String? accessToken;
  String? refreshToken;

  Tokens({this.accessToken, this.refreshToken});

  Tokens.fromJson(Map<String, dynamic> json) {
  accessToken = json['access_token'];
  refreshToken = json['refresh_token'];
  }
  }