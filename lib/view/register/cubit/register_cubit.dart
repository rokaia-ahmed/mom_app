import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_app/view/register/cubit/register_states.dart';
import '../../../core/models/user_model.dart';
import '../../../core/network/dio_helper.dart';
import '../../../core/network/end_points.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit() : super(InitRegisterState());
  static RegisterCubit get(context) => BlocProvider.of(context);

  UserModel ?userModel ;
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