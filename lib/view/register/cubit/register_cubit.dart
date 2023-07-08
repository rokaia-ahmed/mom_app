import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_app/view/register/cubit/register_states.dart';
import '../../../core/models/user_model.dart';
import '../../../core/network/dio_helper.dart';
import '../../../core/network/end_points.dart';

class RegisterCubit extends Cubit<RegisterStates>{

  bool visible=true;
  void changePasswordVisibility(){
    visible=!visible;
    emit(ChangePasswordVisibilityState());
  }

  RegisterCubit() : super(InitRegisterState());
  static RegisterCubit get(context) => BlocProvider.of(context);

  UserModel ?userModel ;
  void userSignIn({
    required String email ,
    required String password ,
  }){
    print('Done... ');
    emit(SignInLoadingState());
    DioHelper.postData(
        url: LOGIN,
        data:
        {
          'email': email,
          'password':password,
        }
    ).then((value){
      userModel= UserModel.fromJson(value.data);
      print(userModel!.tokens!.accessToken);
      emit(SignInSuccessState(userModel!));
      print('success');
    }
    ).catchError((error){
      print(error.toString());
      emit(SignInErrorState(error.toString()));
      print('error...');
    });

  }
  void userSignUp({
    required String firstName ,
    required String lastName ,
    required String email ,
    required String password ,
  }){
    print('Done... ');
    emit(SignUpLoadingState());
    DioHelper.postData(
        url: SIGNUP,
        data:
        {
          'firstname': firstName ,
          'lastname': lastName ,
          'email': email,
          'password':password,
        }
    ).then((value){
      userModel= UserModel.fromJson(value.data);
      print(userModel!.tokens!.accessToken);
      emit(SignUpSuccessState());
      print('success');
    }
    ).catchError((error){
      print(error.toString());
      emit(SignUpErrorState(error.toString()));
      print('error...');
    });

  }

}