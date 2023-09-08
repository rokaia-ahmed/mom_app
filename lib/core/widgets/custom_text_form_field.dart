import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/app_colors.dart';

OutlineInputBorder _defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
      color: Colors.transparent,
      width: 0,
    ));

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.width,
    this.controller,
    required this.hintText,
    this.suffixIcon,
    this.valid,
    this.height,
    this.visible = false,
    this.backGroundColor,
    this.keyboardType,
    this.inputFormatters,
    this.onTap,
    this.maxLines,
    this.textAlign,
  }) : super(key: key);

  final double? width;
  final String hintText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool visible;
  final String? Function(String?)? valid;
  final Function()? onTap;
  final double? height;
  final Color? backGroundColor;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: controller,
        obscureText: visible,
        validator: valid,
        textAlign: textAlign ?? TextAlign.left,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        onTap: onTap,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
          filled: true,
          enabledBorder: _defaultBorder,
          focusedBorder: _defaultBorder,
          errorBorder: _defaultBorder,
          border: _defaultBorder,
          focusedErrorBorder: _defaultBorder,
          fillColor: backGroundColor ?? AppColors.lightGreen,
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
          suffixIcon: suffixIcon,
          suffixIconColor: Colors.black,
          hintStyle: const TextStyle(
            color: AppColors.green,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
