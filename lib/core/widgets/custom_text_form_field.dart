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
     this.backGroundColor
  }) : super(key: key);

   double? width;
   String hintText;
   Widget? suffixIcon;
  TextEditingController? controller;
  bool visible;
  String? Function(String?)? valid;
  double? height;
   Color? backGroundColor;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width,
      height: height ?? context.height *0.065,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color:backGroundColor ?? AppColors.lightGreen,
      ),
      child:TextFormField(
        controller: controller,
        obscureText: visible,
        validator: valid,
        textAlign: TextAlign.left,
        decoration:  InputDecoration(
          border:InputBorder.none,
          contentPadding: const EdgeInsets.all(10),
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
