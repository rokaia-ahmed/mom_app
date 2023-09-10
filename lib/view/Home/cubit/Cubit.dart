
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_app/view/Home/cubit/states.dart';
import '../../Tracker/Tracking.dart';
import '../../community/screens/community.dart';
import '../../learning/screens/Learning.dart';
import '../../shop/Shop.dart';
import '../screens/home.dart';


class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(HomeInitialStates());
  static HomeCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  List<Widget> screens=[
    const Home(),
     Community(),
    const Tracking(),
     Learning(),
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
      Icons.menu_book_outlined
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

  int  medicalHistoryIndex =0;
  void changeMedicalHistory(int index){
    medicalHistoryIndex=index;
    emit(ChangeMedicalHistoryState());
  }
}