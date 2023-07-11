

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_app/core/network/cache_helper.dart';
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

  UserModel ? userModel ;
  Future<void> userSignIn({
    required String email ,
    required String password ,
  })async{
    print('Done... ');
    emit(SignInLoadingState());
   await DioHelper.postData(
        url: LOGIN,
        data:
        {
          'email': email,
          'password':password,
        }
    ).then((value){
      print(value.data['message']);
      emit(SignInSuccessState());
      print('success');
    }
    ).catchError((error){
      print(error.toString());
      emit(SignInErrorState(error.toString()));
      print('error...');
    });

  }

  Future<void> userSignUp({
    required String firstName ,
    required String lastName ,
    required String email ,
    required String password ,
  })async {
    print('Done... ');
    emit(SignUpLoadingState());
    await DioHelper.postData(
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
      print(userModel!.accessToken);
      emit(SignUpSuccessState());
      print('success');
    }
    ).catchError((error){
      print(error.toString());
      emit(SignUpErrorState(error.toString()));
      print('error...');
    });

  }

 //TODO FORGET PASSWORD
  Future<void> sendEmail({
    required String email ,
  })async{
    print('Done... ');
    emit(SendEmailLoadingState());
    await DioHelper.postData(
        url: SENDEMAIL,
        data:
        {
          'email': email,
        }
    ).then((value){
      print(value.data);
      emit(SendEmailSuccessState());
      print('success');
    }
    ).catchError((error){
      print(error.toString());
      emit(SendEmailErrorState(error.toString()));
      print('error...');
    });

  }

  Future<void> verifyEmail({
    required String email ,
    required String code ,
  })async{
    print('Done... ');
    emit(VerifyEmailLoadingState());
    await DioHelper.postData(
        url: '$VERIFYEMAIL$code',
        data:
        {
          'email': email,
        }
    ).then((value){
      print(value.data);
      emit(VerifyEmailSuccessState());
      print('success');
    }
    ).catchError((error){
      emit(VerifyEmailErrorState(error.toString()));
      print('error when verify email ${error.toString()}');
    });

  }

  Future<void> resetPassword({
    required String password ,
    required String code ,
  })async{
    print('Done... ');
    emit(RestPasswordLoadingState());
    await DioHelper.postData(
        url: '$RESETPASSWORD$code',
        data:
        {
          'password': password,
          'email': CacheHelper.getData(key: 'email'),
        }
    ).then((value){
      print(value.data);
      emit(RestPasswordSuccessState());
      print('success');
    }
    ).catchError((error){
      emit(RestPasswordErrorState(error.toString()));
      print('error when resetPassword ${error.toString()}');
    });

  }
}