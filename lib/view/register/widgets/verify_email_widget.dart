import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        BuildContainer(controller:num1 ),
        BuildContainer(controller:num2 ),
        BuildContainer(controller:num3 ),
        BuildContainer(controller:num4 ),
      ],
    );
  }
}

class BuildContainer extends StatelessWidget {
  const BuildContainer({super.key, required this.controller});
   final TextEditingController controller ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width*0.15,
      height: context.height *0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color:AppColors.lightGreen,
      ),
      child:TextFormField(
        controller: controller,
        maxLength:1 ,
        textAlign: TextAlign.center,
        keyboardType:TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
        decoration:const InputDecoration(
          counter:Offstage() ,
          border:InputBorder.none,
          contentPadding: EdgeInsets.only(left: 10),
        ),
      ) ,
    );
  }
}

