import 'package:flutter/material.dart';
import 'package:mom_app/core/utils/media_query_values.dart';

import '../utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key,
    this.width,
    required this.hintText,
    this.suffixIcon,
  }) : super(key: key);

  final double? width;
  final String hintText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: context.height *0.065,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color:AppColors.lightGreen,
      ),
      child:TextFormField(
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
