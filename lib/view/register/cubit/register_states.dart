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
class SignInSuccessState extends RegisterStates {}
class SignInErrorState extends RegisterStates {
  String errorMessage;
  SignInErrorState(this.errorMessage);
}
class ChangePasswordVisibilityState extends RegisterStates {}

class SendEmailLoadingState extends RegisterStates {}
class SendEmailSuccessState extends RegisterStates {}
class SendEmailErrorState extends RegisterStates {
  String errorMessage;
  SendEmailErrorState(this.errorMessage);
}

class VerifyEmailLoadingState extends RegisterStates {}
class VerifyEmailSuccessState extends RegisterStates {}
class VerifyEmailErrorState extends RegisterStates {
  String errorMessage;
  VerifyEmailErrorState(this.errorMessage);
}

class RestPasswordLoadingState extends RegisterStates {}
class RestPasswordSuccessState extends RegisterStates {}
class RestPasswordErrorState extends RegisterStates {
  String errorMessage;
  RestPasswordErrorState(this.errorMessage);
}