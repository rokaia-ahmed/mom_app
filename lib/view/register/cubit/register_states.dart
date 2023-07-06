import '../../../core/models/user_model.dart';

abstract class RegisterStates{}
class InitRegisterState extends RegisterStates {}

class SignUpLoadingState extends RegisterStates {}
class SignUpSuccessState extends RegisterStates {}
class SignUpErrorState extends RegisterStates {
  String errorMessage;
  SignUpErrorState(this.errorMessage);
}

class SignInLoadingState extends RegisterStates {}
class SignInSuccessState extends RegisterStates {
  late final UserModel loginModel;
  SignInSuccessState(this.loginModel);
}
class SignInErrorState extends RegisterStates {
  String errorMessage;
  SignInErrorState(this.errorMessage);
}
class ChangePasswordVisibilityState extends RegisterStates {}