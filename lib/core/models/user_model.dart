class UserModel {
  String? id;
  String? firstname;
  String? lastname;
  String? email;
  String? message;
  String? accessToken;
  String? refreshToken;
  UserModel({this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.accessToken,
    this.refreshToken,
    this.message,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    message =json['message'];
  }
}

