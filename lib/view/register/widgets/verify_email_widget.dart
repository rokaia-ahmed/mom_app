import 'package:flutter/material.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import '../../../core/utils/app_colors.dart';

class VerifyEmailWidget extends StatelessWidget {
  const VerifyEmailWidget({Key? key}) : super(key: key);

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
