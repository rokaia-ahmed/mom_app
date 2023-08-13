



import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mom_app/core/models/activity_model.dart';
import 'package:mom_app/core/models/all_Growth_model.dart';
import 'package:mom_app/core/models/all_baby_first_model.dart';
import 'package:mom_app/core/models/last_feeding_model.dart';
import 'package:mom_app/core/network/dio_helper.dart';
import 'package:mom_app/core/utils/component.dart';
import 'package:mom_app/core/widgets/overlay_entry_card.dart';
import 'package:mom_app/view/Tracker/healthscreens/cubit/tracker_states.dart';
import '../../../../../../../core/models/Growth_model.dart';
import '../../../../../../../core/models/all_Meals_model.dart';
import '../../../../../../../core/models/all_activity_model.dart';
import '../../../../../../../core/models/all_reminder_model.dart';
import '../../../../../../../core/models/baby_first_model.dart';
import '../../../../../../../core/models/reminder_model.dart';
import '../../../../../../../core/network/end_points.dart';
class TrackerCubit extends Cubit<TrackerStates>{
  TrackerCubit() : super(InitialActivityState());
  static TrackerCubit get(context)=>BlocProvider.of(context);
  late String errorAddActivity;
  ActivityModel? activityModel ;
  Future<void> addActivity({
    required String activity,
    required String time,
    required String note,
    required String date
  })async {
    emit(AddActivityLoadingState());
    await  DioHelper.postDataWithToken(
      url: ADDACTIVITY,
      token: await getToken(), data: {
      'activity': activity,
      'time': time,
      'note': note,
      'date': date,
    } ,
    ).then((value){
      activityModel = ActivityModel.fromJson(value.data);
      print(activityModel!.message);
      if(value.statusCode==201){
        print(value.data['message']);
        getAllActivity();
        disposeOverlay();
      }
      emit(AddActivitySuccessState());
    }).catchError((error){
      if(error is DioException){
        errorAddActivity=error.response!.data['message'][0];
        showToast(
          text: '${error.response!.data['message']}',
          state: ToastStates.error,
        );
      }
      emit(AddActivityErrorState(error.toString()));
    });
  }
  bool isInitialized = false;
  void changeIsInitialized(){
    isInitialized=!isInitialized;
    emit(ChangeInitializationState());
  }
  GetAllActivityModel? getAllActivityModel;
  Future<void> getAllActivity()async {
    print(isInitialized);
    // if(!isInitialized)
    {
      emit(AllActivityLoadingState());
      await  DioHelper.getData(url: GETALLACTIVITY,
        token:await getToken() ,).then((value){
        getAllActivityModel = GetAllActivityModel.fromJson(value.data);
        print("all activity");
        print(getAllActivityModel!.message);
        if(value.statusCode==200){
          print(value.data['message']);
          changeIsInitialized();
          print(isInitialized);

        }
        emit(AllActivitySuccessState());
      }).catchError((error){
        if(error is DioException){
          errorAddActivity=error.response!.data['message'][0];
          print('error when get all activity ${error.response!.data['message']}');
          showToast(
            text: '${error.response!.data['message']}',
            state: ToastStates.error,
          );
        }
        emit(AllActivityErrorState(error.toString()));
      });
    }
  }
  Future<void> updateActivity({
      required String id,
      required String activity,
      required String time,
      required String note,
      required String date
  })async {
      emit(UpdateActivityLoadingState());
      await  DioHelper.updateData(url: '$UPDATEACTIVITY$id',
        token:await getToken(),
        data: {
          // 'id':id,
          'date': date,
          'activity': activity,
          'time': time,
          'note': note,

        } ,
      ).then((value){
        // activityModel = ActivityModel.fromJson(value.data);
        if(value.statusCode==200){
          print(value.data['message']);
          getAllActivity();
          disposeOverlay();
        }
        emit(UpdateActivitySuccessState());
      }).catchError((error){
        if(error is DioException){
          print(error.type);
          print(error.error);
          // errorAddActivity=error.response!.data['message'][0]
          print('error when update activity ${error.response?.data['message'][0]}');
          showToast(
            text: '${error.response!.data['message']}',
            state: ToastStates.error,
          );
        }
        emit(UpdateActivityErrorState(error.toString()));
      });
    }

  Future<void> deleteActivity({
   String? id,
})async {
    emit(DeleteActivityLoadingState());
    await  DioHelper.deleteData(url:'$DELETEACTIVITY$id',
      token:await getToken() ,).then((value){
        print("$id");
      if(value.statusCode==200){
        print(value.data['message']);
        getAllActivity();
      }
      emit(DeleteActivitySuccessState());
    }).catchError((error){
      if(error is DioException){
        // errorAddActivity=error.response!.data['message'][0];
        print('error when delete activity ${error.response!.data['message']}');
      }
      showToast(
        text: '${error.response!.data['message']}',
        state: ToastStates.error,
      );
      emit(DeleteActivityErrorState(error.toString()));
    });
  }

  late String errorAddReminder;
  ReminderModel? reminderModel ;
  Future<void> addReminder({
    required String time,
    required String note,
    required String date
  })async {
    emit(AddActivityLoadingState());
    await  DioHelper.postDataWithToken(
      url: ADDREMINDER,
      token: await getToken(), data: {
      'time': time,
      'note': note,
      'date': date,
    } ,
    ).then((value){
      reminderModel = ReminderModel.fromJson(value.data);
      if(value.statusCode==201){
        print(value.data['message']);
        getAllReminder();
        disposeOverlay();
      }
      emit(AddActivitySuccessState());
    }).catchError((error){
      if(error is DioException){
        errorAddActivity=error.response!.data['message'][0];
        print('error when add activity ${error.response!.data['message']}');
        showToast(
          text: '${error.response!.data['message']}',
          state: ToastStates.error,
        );
      }
      emit(AddActivityErrorState(error.toString()));
    });
  }

  GetAllReminderModel? getAllReminderModel;
  Future<void> getAllReminder()async {
    print(isInitialized);
    // if(!isInitialized)
        {
      emit(AllActivityLoadingState());
      await  DioHelper.getData(url: GETALLREMINDER,
        token:await getToken() ,).then((value){
        getAllReminderModel = GetAllReminderModel.fromJson(value.data);
        if(value.statusCode==200){
          print(value.data['message']);
          changeIsInitialized();
        }
        emit(AllActivitySuccessState());
      }).catchError((error){
        if(error is DioException){
          errorAddActivity=error.response!.data['message'][0];
          print('error when get all activity ${error.response!.data['message']}');
          showToast(
            text: '${error.response!.data['message']}',
            state: ToastStates.error,
          );
        }

        emit(AllActivityErrorState(error.toString()));
      });
    }
  }
  Future<void> updateReminder({
    required String id,
    required String time,
    required String note,
    required String date
  })async {
    emit(UpdateActivityLoadingState());
    await  DioHelper.updateData(url: '$UPDATEREMINDER$id',
      token:await getToken(),
      data: {
        'date': date,
        'time': time,
        'note': note,
      } ,
    ).then((value){
      // activityModel = ActivityModel.fromJson(value.data);
      if(value.statusCode==200){
        print(value.data['message']);
        getAllReminder();
        disposeOverlay();
      }
      emit(UpdateActivitySuccessState());
    }).catchError((error){
      if(error is DioException){
        print(error.type);
        print(error.error);
        // errorAddActivity=error.response!.data['message'][0]
        print('error when update reminders ${error.response?.data['message'][0]}');
        showToast(
          text: '${error.response!.data['message']}',
          state: ToastStates.error,
        );
      }
      emit(UpdateActivityErrorState(error.toString()));
    });
  }

  Future<void> deleteReminder({
    String? id,
  })async {
    emit(DeleteActivityLoadingState());
    await  DioHelper.deleteData(url:'$DELETEREMINDER$id',
      token:await getToken() ,).then((value){
      print("$id");
      if(value.statusCode==200){
        getAllReminder();
      }
      emit(DeleteActivitySuccessState());
    }).catchError((error){
      if(error is DioException){
        // errorAddActivity=error.response!.data['message'][0];
        print('error when delete activity ${error.response!.data['message']}');
      }
      showToast(
        text: '${error.response!.data['message']}',
        state: ToastStates.error,
      );
      emit(DeleteActivityErrorState(error.toString()));
    });
  }

  BabyFirstModel? babyFirstModel ;
  Future<void> addBabyFirst({
    required String babyFirst,
    required String note,
    required String date,
    required String image,
  })async {
    emit(AddActivityLoadingState());
    await  DioHelper.postDataWithToken(
      url: ADDBABYFIRST,
      token: await getToken(), data: {
      'date': date,
      'babyFirst': babyFirst,
      'note': note,
      'image': image,
    } ,
    ).then((value){
      babyFirstModel = BabyFirstModel.fromJson(value.data);
      if(value.statusCode==201){
        print(value.data['message']);
        getAllBabyFirst();
        disposeOverlay();
      }
      emit(AddActivitySuccessState());
    }).catchError((error){
      if(error is DioException){
        // errorAddActivity=error.response!.data['message'][0];
        print('error when add activity ${error.response!.data['message']}');
        showToast(
          text: '${error.response!.data['message']}',
          state: ToastStates.error,
        );
      }
      emit(AddActivityErrorState(error.toString()));
    });
  }

  GetAllBabyFirstModel? getAllBabyFirstModel;
  Future<void> getAllBabyFirst()async {
    print(isInitialized);
    // if(!isInitialized)
        {
      emit(AllActivityLoadingState());
      await  DioHelper.getData(url: GETALLBABYFIRST,
        token:await getToken() ,).then((value){
        getAllBabyFirstModel = GetAllBabyFirstModel.fromJson(value.data);
        if(value.statusCode==200){
          print(value.data['message']);
          changeIsInitialized();
        }
        emit(AllActivitySuccessState());
      }).catchError((error){
        if(error is DioException){
          errorAddActivity=error.response!.data['message'][0];
          print('error when get all activity ${error.response!.data['message']}');
          showToast(
            text: '${error.response!.data['message']}',
            state: ToastStates.error,
          );
        }
        emit(AllActivityErrorState(error.toString()));
      });
    }
  }
  Future<void> updateBabyFirst({
    required String id,
    required String babyFirst,
    required String note,
    required String date,
    required String image,
  })async {
    emit(UpdateActivityLoadingState());
    await  DioHelper.updateData(url: '$UPDATEBABYFIRST$id',
      token:await getToken(),
      data: {
        'date': date,
        'babyFirst': babyFirst,
        'note': note,
        'image': image,
      } ,
    ).then((value){
      // activityModel = ActivityModel.fromJson(value.data);
      if(value.statusCode==200){
        print(value.data['message']);
        getAllBabyFirst();
        disposeOverlay();
      }
      emit(UpdateActivitySuccessState());
    }).catchError((error){
      if(error is DioException){
        print(error.type);
        print(error.error);
        // errorAddActivity=error.response!.data['message'][0]
        print('error when update reminders ${error.response?.data['message'][0]}');
        showToast(
          text: '${error.response!.data['message']}',
          state: ToastStates.error,
        );
      }
      emit(UpdateActivityErrorState(error.toString()));
    });
  }

  Future<void> deleteBabyFirst({
    String? id,
  })async {
    emit(DeleteActivityLoadingState());
    await  DioHelper.deleteData(url:'$DELETEBABYFIRST$id',
      token:await getToken() ,).then((value){
      print("$id");
      if(value.statusCode==200){
        getAllBabyFirst();
      }
      emit(DeleteActivitySuccessState());
    }).catchError((error){
      if(error is DioException){
        // errorAddActivity=error.response!.data['message'][0];
        print('error when delete baby first ${error.response!.data['message']}');
      }
      showToast(
        text: '${error.response!.data['message']}',
        state: ToastStates.error,
      );
      emit(DeleteActivityErrorState(error.toString()));
    });
  }

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
  LastFeedingModel? lastFeedingModel ;
  Future<void> addLastFeeding({
    required String food,
    required String time,
    required String note,
    required String date
  })async {
    emit(AddActivityLoadingState());
    await  DioHelper.postDataWithToken(
      url: ADDMEAL,
      token: await getToken(), data: {
      'food': food,
      'time': time,
      'note': note,
      'date': date,
    } ,
    ).then((value){
      lastFeedingModel = LastFeedingModel.fromJson(value.data);
      // print(activityModel!.message);
      if(value.statusCode==201){
        print(value.data['message']);
        getAllLastFeeding();
        disposeOverlay();
      }
      emit(AddActivitySuccessState());
    }).catchError((error){
      if(error is DioException){
        // errorAddActivity=error.response!.data['message'][0];
        showToast(
          text: '${error.response!.data['message']}',
          state: ToastStates.error,
        );
      }
      emit(AddActivityErrorState(error.toString()));
    });
  }
  GetAllMealModel? getAllMealModel;
  Future<void> getAllLastFeeding()async {
    print(isInitialized);
    // if(!isInitialized)
        {
      emit(AllActivityLoadingState());
      await  DioHelper.getData(url: GETALLMEALS,
        token:await getToken() ,).then((value){
        getAllMealModel = GetAllMealModel.fromJson(value.data);
        if(value.statusCode==200){
          print(value.data['message']);
          changeIsInitialized();
        }
        emit(AllActivitySuccessState());
      }).catchError((error){
        if(error is DioException){
          errorAddActivity=error.response!.data['message'][0];
          print('error when get all activity ${error.response!.data['message']}');
          showToast(
            text: '${error.response!.data['message']}',
            state: ToastStates.error,
          );
        }
        emit(AllActivityErrorState(error.toString()));
      });
    }
  }
  Future<void> updateLastFeeding({
    required String id,
    required String food,
    required String note,
    required String date,
    required String time,
  })async {
    emit(UpdateActivityLoadingState());
    await  DioHelper.updateData(url: '$UPDATEMEAL$id',
      token:await getToken(),
      data: {
        'date': date,
        'food': food,
        'note': note,
        'time': time,
      } ,
    ).then((value){
      // activityModel = ActivityModel.fromJson(value.data);
      if(value.statusCode==200){
        print(value.data['message']);
        getAllLastFeeding();
        disposeOverlay();
      }
      emit(UpdateActivitySuccessState());
    }).catchError((error){
      if(error is DioException){
        print(error.type);
        print(error.error);
        // errorAddActivity=error.response!.data['message'][0]
        print('error when update meal ${error.response?.data['message'][0]}');
        showToast(
          text: '${error.response!.data['message']}',
          state: ToastStates.error,
        );
      }
      emit(UpdateActivityErrorState(error.toString()));
    });
  }

  Future<void> deleteLastFeeding({
    String? id,
  })async {
    emit(DeleteActivityLoadingState());
    await  DioHelper.deleteData(url:'$DELETEMEAL$id',
      token:await getToken() ,).then((value){
      print("$id");
      if(value.statusCode==200){
        getAllLastFeeding();
      }
      emit(DeleteActivitySuccessState());
    }).catchError((error){
      if(error is DioException){
        // errorAddActivity=error.response!.data['message'][0];
        print('error when delete meal ${error.response!.data['message']}');
      }
      showToast(
        text: '${error.response!.data['message']}',
        state: ToastStates.error,
      );
      emit(DeleteActivityErrorState(error.toString()));
    });
  }

  GrowthModel? growthModel ;
  Future<void> addGrowth({
    required String height,
    required String weight,
    // required String note,
    required String date
  })async {
    emit(AddActivityLoadingState());
    await  DioHelper.postDataWithToken(
      url: ADDGROWTH,
      token: await getToken(), data: {
      'date': date,
      'height': height,
      'weight': weight,
    } ,
    ).then((value){
      growthModel = GrowthModel.fromJson(value.data);
      // print(activityModel!.message);
      if(value.statusCode==201){
        print(value.data['message']);
        getAllActivity();
        disposeOverlay();
      }
      emit(AddActivitySuccessState());
    }).catchError((error){
      if(error is DioException){
        // errorAddActivity=error.response!.data['message'][0];
        print("${error.response!.data['message']}");
        showToast(
          text: '${error.response!.data['message']}',
          state: ToastStates.error,
        );

      }
      emit(AddActivityErrorState(error.toString()));
    });
  }

  GetAllGrowthModel? getAllGrowthModel;
  Future<void> getAllGrowth()async {
    print(isInitialized);
    // if(!isInitialized)
        {
      emit(AllActivityLoadingState());
      await  DioHelper.getData(url: GETALLGROWTH,
        token:await getToken() ,).then((value){
        getAllGrowthModel = GetAllGrowthModel.fromJson(value.data);
        // print("all activity");
        print(getAllGrowthModel!.message);
        if(value.statusCode==200){
          print(value.data['message']);
        }
        emit(AllActivitySuccessState());
      }).catchError((error){
        if(error is DioException){
          // errorAddActivity=error.response!.data['message'][0];
          print('error when get all Growths ${error.response!.data['message']}');
          showToast(
            text: '${error.response!.data['message']}',
            state: ToastStates.error,
          );
        }
        emit(AllActivityErrorState(error.toString()));
      });
    }
  }
  Future<void> updateGrowth({
    required String id,
    required String height,
    required String weight,
    // required String note,
    required String date
  })async {
    emit(UpdateActivityLoadingState());
    await  DioHelper.updateData(url: '$UPDATEGROWTH$id',
      token:await getToken(),
      data: {
        'date': date,
        'height': height,
        'weight': weight,
      } ,
    ).then((value){
      if(value.statusCode==200){
        print(value.data['message']);
        getAllGrowth();
        disposeOverlay();
      }
      emit(UpdateActivitySuccessState());
    }).catchError((error){
      if(error is DioException){
        print(error.type);
        print(error.error);
        // errorAddActivity=error.response!.data['message'][0]
        print('error when update activity ${error.response?.data['message'][0]}');
        showToast(
          text: '${error.response!.data['message']}',
          state: ToastStates.error,
        );
      }
      emit(UpdateActivityErrorState(error.toString()));
    });
  }

  Future<void> deleteGrowth({
    String? id,
  })async {
    emit(DeleteActivityLoadingState());
    await  DioHelper.deleteData(url:'$DELETEGROWTH$id',
      token:await getToken() ,).then((value){
      print("$id");
      if(value.statusCode==200){
        print(value.data['message']);
        getAllActivity();
      }
      emit(DeleteActivitySuccessState());
    }).catchError((error){
      if(error is DioException){
        // errorAddActivity=error.response!.data['message'][0];
        print('error when delete activity ${error.response!.data['message']}');
      }
      showToast(
        text: '${error.response!.data['message']}',
        state: ToastStates.error,
      );
      emit(DeleteActivityErrorState(error.toString()));
    });
  }
}