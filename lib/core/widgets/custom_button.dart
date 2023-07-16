import 'package:flutter/material.dart';
import 'package:mom_app/core/utils/media_query_values.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({this.child, required this.onTap,Key? key}) : super(key: key);
  final Widget? child;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        width: double.infinity,
        height: context.height*0.07,
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ) ,
        child:child ,
      ),
    );
  }
}
