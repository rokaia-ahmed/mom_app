import 'package:flutter/cupertino.dart';

Widget topScreenColorLine({required color}){
  return Container(
    height: 10.0,
    decoration:  BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        )
    ),
  );
}