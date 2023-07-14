
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mom_app/core/network/cache_helper.dart';
import 'package:mom_app/core/network/dio_helper.dart';
import 'package:mom_app/view/Baby_Info/cubit/baby_state.dart';
import '../../../core/network/end_points.dart';

class BabyCubit extends Cubit<BabyStates>{
  BabyCubit() : super(InitialBabyState());
 static BabyCubit get(context)=>BlocProvider.of(context);

  //TODO ADD IMAGE
  ImagePicker picker = ImagePicker();
  XFile? image;
  File? imageShow;
  Future<void> addImage() async {
   final XFile? pickedFile =
    await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = pickedFile ;
      imageShow =File(pickedFile.path);
      print('image done');
      emit(SuccessPickImageState());
    } else {
      print('No image selected.');
      emit(ErrorPickImageState());
    }
  }

 void addBaby({
    required String babyName,
    required String gender,
    required String birthDate,
     String? wight,
})async {
   emit(AddBabyLoadingState());
   //String fileName = image!.path.split('/').last;
   FormData formData = FormData.fromMap({
     'babyName':babyName,
     'gender':gender,
     'birthDate':birthDate,
     //'weight': wight,
     'images':  await MultipartFile.fromFile(image!.path,),
   });

   DioHelper.postFormData(
       url: ADDBABY,
       data:formData,
       token:CacheHelper.getData(key:'token'),
   ).then((value){
     print(value.data);
     if(value.statusCode==400){
       print(value.data['message']);
     }
     emit(AddBabySuccessState());
   }).catchError((error){
     emit(AddBabyErrorState(error.toString()));
     print('error when add baby ${error.toString()}');
   });
 }
}