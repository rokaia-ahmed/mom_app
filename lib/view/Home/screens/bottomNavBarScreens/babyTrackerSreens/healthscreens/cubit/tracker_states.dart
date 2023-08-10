import 'package:mom_app/view/Baby_Info/cubit/baby_state.dart';

abstract class TrackerStates{}
class InitialActivityState extends TrackerStates{}

class SuccessPickImageState extends TrackerStates{}
class ErrorPickImageState extends TrackerStates{}

class AddActivityLoadingState extends TrackerStates{}
class AddActivitySuccessState extends TrackerStates{}
class AddActivityErrorState extends TrackerStates{
  String error;
  AddActivityErrorState(this.error);
}
class ChangeInitializationState extends TrackerStates{}

class AllActivityLoadingState extends TrackerStates{}
class AllActivitySuccessState extends TrackerStates{}
class AllActivityErrorState extends TrackerStates{
  String error;
  AllActivityErrorState(this.error);
}
class UpdateActivityLoadingState extends TrackerStates{}
class UpdateActivitySuccessState extends TrackerStates{}
class UpdateActivityErrorState extends TrackerStates{
  String error;
  UpdateActivityErrorState(this.error);
}
class DeleteActivityLoadingState extends TrackerStates{}
class DeleteActivitySuccessState extends TrackerStates{}
class DeleteActivityErrorState extends TrackerStates{
  String error;
  DeleteActivityErrorState(this.error);
}
