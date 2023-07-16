abstract class BabyStates{}
class InitialBabyState extends BabyStates{}

class AddBabyLoadingState extends BabyStates{}
class AddBabySuccessState extends BabyStates{}
class AddBabyErrorState extends BabyStates{
  String error;
  AddBabyErrorState(this.error);
}

class SuccessPickImageState extends BabyStates{}
class ErrorPickImageState extends BabyStates{}