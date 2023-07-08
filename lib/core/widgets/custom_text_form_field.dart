import 'package:flutter/material.dart';
import 'package:mom_app/core/utils/media_query_values.dart';

import '../utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({Key? key,
    this.width,
     this.controller,
    required this.hintText,
    this.suffixIcon,
     this.valid,
     this.height,
    required this.visible,
     this.backgroundcolor
  }) : super(key: key);

  final double? width;
  final String hintText;
  final Widget? suffixIcon;
  final controller;
  bool visible;
  final valid;
  final height;
   final backgroundcolor;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width,
      height: height==null? context.height *0.065:height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color:backgroundcolor==null?AppColors.lightGreen:backgroundcolor,
      ),
      child:TextFormField(
        controller: controller,

        obscureText: visible,
        validator: valid,
        decoration:  InputDecoration(
          border:InputBorder.none,
          contentPadding: const EdgeInsets.only(left: 10),
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle:const TextStyle(
            color: AppColors.green,
            fontSize: 14,
          ),
        ),
      ) ,
    );
  }
}
