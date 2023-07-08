import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_app/view/Home/screens/bottomNavBarScreens/Learning.dart';
import 'package:mom_app/view/Home/screens/bottomNavBarScreens/Tracking.dart';
import 'package:mom_app/view/Home/screens/bottomNavBarScreens/community/community.dart';
import 'package:mom_app/view/Home/screens/cubit/states.dart';
import '../bottomNavBarScreens/Home.dart';
import '../bottomNavBarScreens/Shop.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(HomeInitialStates());
  static HomeCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  List<Widget> screens=[
    const Home(),
    const Community(),
    const Tracking(),
    const Learning(),
    const Shop(),
  ];
  List<String>titles=[
    'Home',
    'Community',
    'Tracking',
    'Learning',
    'Shop',
  ];
List<BottomNavigationBarItem> screenItems=[
  const BottomNavigationBarItem(icon:Icon(
    Icons.home_outlined
  ),
  label:'Home' ),
  const BottomNavigationBarItem(icon:Icon(
      Icons.group_outlined
  ),
      label:'Community' ),
  const BottomNavigationBarItem(icon:Icon(
      Icons.baby_changing_station
  ),
      label:'Tracking' ),
  const BottomNavigationBarItem(icon:Icon(
      Icons.book_outlined
  ),
      label:'Learning' ),
  const BottomNavigationBarItem(icon:Icon(
      Icons.shopping_cart_outlined
  ),
      label:'Shop' ),
];
void ChangeIndex(int index){
  currentIndex=index;
  emit(HomeChangeBottomNavBarState());
}

bool notification=true;
bool visible=true;
  void changeVisibility(){
    visible=!visible;
    emit(ChangeVisibilityState());
  }
int  communityIndex =0;
  void changeCommunity(int index){
    communityIndex=index;
    emit(ChangeCommunityState());
  }
  // PlantRegisterModel? plantLoginModel;
  // void userLogin({required String email,required String password}){
  //
  //   emit(SignInLoadingState());
  //   DioHelper.postData(url: LOGIN, data:{
  //     'email':email,
  //     'password':password,
  //   }).then((value){
  //     //pass data
  //     plantLoginModel= PlantRegisterModel.fromJson(value.data);
  //
  //     // print(plantLoginModel!.data?.userId);
  //     emit(SignInSuccessState());
  //     // print(plantLoginModel?.type);
  //     print(plantLoginModel!.message);
  //     print(plantLoginModel!.data?.firstName);
  //     print(plantLoginModel!.data?.email);
  //   }).catchError((error){
  //     if (error is DioError){
  //       print(error.response!.data['message']);
  //     }
  //     print(error.toString());
  //     emit(SignInErrorState(error.toString()));
  //   });
  // }

}