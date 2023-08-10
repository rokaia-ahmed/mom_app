import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_app/core/models/baby_info_model.dart';
import 'package:mom_app/core/models/login_model.dart';
import 'package:mom_app/core/network/cache_helper.dart';
import 'package:mom_app/view/register/cubit/register_states.dart';
import '../../../core/models/user_model.dart';
import '../../../core/network/dio_helper.dart';
import '../../../core/network/end_points.dart';
import '../../../core/utils/app_strings.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  bool visible = true;
  void changePasswordVisibility() {
    visible = !visible;
    emit(ChangePasswordVisibilityState());
  }

  RegisterCubit() : super(InitRegisterState());
  static RegisterCubit get(context) => BlocProvider.of(context);

  late String errorSignIn;
  Future<void> userSignIn({
    required String email,
    required String password,
  }) async {
    emit(SignInLoadingState());
    await DioHelper.postData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      print(value.data['message']);
      CacheHelper.saveData(key: AppStrings.userData, value: value.data);
      LoginModel user = LoginModel.fromJson(value.data);
      for (User user in user.baby) {
        CacheHelper.addBaby(user.id!);
      }
      print('cache =${CacheHelper.getData()!.accessToken}');
      emit(SignInSuccessState());
      print('success');
    }).catchError((error) {
      if (error is DioException) {
        print(error.response!.data['message'].toString());
        errorSignIn = error.response!.data['message'].toString();
        emit(SignInErrorState(error.toString()));
      }
    });
  }

  UserModel? userModel;
  late String errorSignUp;
  Future<void> userSignUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    print('Done... ');
    emit(SignUpLoadingState());
    await DioHelper.postData(url: SIGNUP, data: {
      'firstname': firstName,
      'lastname': lastName,
      'email': email,
      'password': password,
    }).then((value) {
      userModel = UserModel.fromJson(value.data);
      emit(SignUpSuccessState());
      print('success');
    }).catchError((error) {
      if (error is DioException) {
        print(error.response!.data['message'].toString());
        errorSignUp = error.response!.data['message'].toString();
      }
      emit(SignUpErrorState(error.toString()));
      print('error...');
    });
  }

  late String errorSendEmail;
  //TODO FORGET PASSWORD
  Future<void> sendEmail({
    required String email,
  }) async {
    print('Done... ');
    emit(SendEmailLoadingState());
    await DioHelper.postData(url: SENDEMAIL, data: {
      'email': email,
    }).then((value) {
      print(value.data);
      emit(SendEmailSuccessState());
      print('success');
    }).catchError((error) {
      print(error.toString());
      if (error is DioException) {
        print(error.response!.data['message'].toString());
        errorSendEmail = error.response!.data['message'];
      }
      emit(SendEmailErrorState(error.toString()));
      print('error...');
    });
  }

  Future<void> verifyEmail({
    required String email,
    required String code,
  }) async {
    print('Done... ');
    emit(VerifyEmailLoadingState());
    await DioHelper.postData(url: '$VERIFYEMAIL$code', data: {
      'email': email,
    }).then((value) {
      print(value.data);
      emit(VerifyEmailSuccessState());
      print('success');
    }).catchError((error) {
      emit(VerifyEmailErrorState(error.toString()));
      print('error when verify email ${error.toString()}');
    });
  }

  Future<void> resetPassword({
    required String password,
    required String email,
    required String code,
  }) async {
    print('Done... ');
    emit(RestPasswordLoadingState());
    await DioHelper.postData(url: '$RESETPASSWORD$code', data: {
      'password': password,
      'email': email,
    }).then((value) {
      print(value.data);
      emit(RestPasswordSuccessState());
      print('success');
    }).catchError((error) {
      if (error is DioException) {
        print(error.response!.data['message'].toString());
      }
      emit(RestPasswordErrorState(error.toString()));
      print('error when resetPassword ${error.toString()}');
    });
  }
}
