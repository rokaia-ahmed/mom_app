import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mom_app/core/utils/media_query_values.dart';

import '../utils/app_colors.dart';

Widget addButton({required BuildContext context,required String text,required Color color}){
  return Container(
      padding: EdgeInsets.only(top: 20.0,bottom: 20.0,left: context.width*0.3,right: context.width*.3),
      width: double.infinity,
      color: Colors.white,
      child: ElevatedButton(onPressed: (){}, child:Text(text),style: ElevatedButton.styleFrom(
        primary: color, // Background color of the button
        onPrimary: Colors.white, // Text color of the button
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        // Padding around the button text
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),)));
}
