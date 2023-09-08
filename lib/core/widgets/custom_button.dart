import 'package:flutter/material.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/core/utils/media_query_values.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({this.child, required this.onTap, Key? key})
      : super(key: key);
  final Widget? child;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: context.height * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.width,
      this.height,
      this.size,
      this.color,
      this.backColor});
  final String text;
  final double? width;
  final double? height;
  final double? size;
  final Color? color;
  final VoidCallback onTap;
  final Color? backColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? context.height * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backColor ?? AppColors.primaryColor,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: color ?? Colors.white,
              fontSize: size ?? 20,
            ),
          ),
        ),
      ),
    );
  }
}
