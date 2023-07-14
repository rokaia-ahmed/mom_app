import 'package:flutter/material.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import '../../../core/utils/app_colors.dart';

class VerifyEmailWidget extends StatelessWidget {
   const VerifyEmailWidget({
     required this.num1,
     required this.num2,
     required this.num3,
     required this.num4,
     Key? key}) : super(key: key);
   final  TextEditingController num1;
   final  TextEditingController num2;
   final  TextEditingController num3;
   final  TextEditingController num4;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: context.width*0.15,
          height: context.height *0.07,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color:AppColors.lightGreen,
          ),
          child:TextFormField(
            controller: num1,
            decoration:const InputDecoration(
              border:InputBorder.none,
              contentPadding: EdgeInsets.only(left: 10),
            ),
          ) ,
        ),
        Container(
          width: context.width*0.15,
          height: context.height *0.07,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color:AppColors.lightGreen,
          ),
          child:TextFormField(
            controller: num2,
            decoration:const InputDecoration(
              border:InputBorder.none,
              contentPadding: EdgeInsets.only(left: 10),
            ),
          ) ,
        ),
        Container(
          width: context.width*0.15,
          height: context.height *0.07,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color:AppColors.lightGreen,
          ),
          child:TextFormField(
            controller: num3,
            decoration:const InputDecoration(
              border:InputBorder.none,
              contentPadding: EdgeInsets.only(left: 10),
            ),
          ) ,
        ),
        Container(
          width: context.width*0.15,
          height: context.height *0.07,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color:AppColors.lightGreen,
          ),
          child:TextFormField(
            controller: num4,
            decoration:const InputDecoration(
              border:InputBorder.none,
              contentPadding: EdgeInsets.only(left: 10),
            ),
          ) ,
        ),
      ],
    );
  }
}
