import 'package:flutter/material.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import '../utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {

    const CustomTextFormField({Key? key,
    this.width,
     this.controller,
    required this.hintText,
    this.suffixIcon,
     this.valid,
     this.height,
     this.visible = false,
     this.backGroundColor
  }) : super(key: key);

  final double? width;
   final String hintText;
   final  Widget? suffixIcon;
   final TextEditingController? controller;
   final  bool visible ;
   final String? Function(String?)? valid;
   final double? height;
   final Color? backGroundColor;
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
        obscureText: visible ,
        validator: valid,
        textAlign: TextAlign.left,
        decoration:  InputDecoration(
          border:InputBorder.none,
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
          suffixIcon: suffixIcon,
          suffixIconColor:Colors.black ,
          hintStyle:const TextStyle(
            color: AppColors.green,
            fontSize: 14,
          ),
        ),
      ) ,
    );
  }
}
