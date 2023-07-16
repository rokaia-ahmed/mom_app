import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required String text,
  required ToastStates state,
})=>
    Fluttertoast.showToast(
        msg:text ,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: shoosToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0
    );
//enum
enum ToastStates{success, error ,warning}

Color shoosToastColor(ToastStates state){
  Color color ;
  switch(state)
  {
    case  ToastStates.success :
      color = Colors.green ;
      break;
    case  ToastStates.error :
      color = Colors.red ;
      break;
    case  ToastStates.warning:
      color = Colors.yellow ;
      break;

  }
  return color ;
}