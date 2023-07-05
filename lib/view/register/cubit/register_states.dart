abstract class RegisterStates{}
class InitRegisterState extends RegisterStates {}

class SignUpLoadingState extends RegisterStates {}
class SignUpSuccessState extends RegisterStates {}
class SignUpErrorState extends RegisterStates {
  String errorMessage;
  SignUpErrorState(this.errorMessage);
}