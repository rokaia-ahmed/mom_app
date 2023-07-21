import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

Widget customIconButton({ icon,required onTap,required isIcon,text, fontSize,color,decoration,iconSize}){
  return InkWell(
      onTap: onTap,
      child:isIcon? Icon(icon,color:color==null? AppColors.green:color,size: iconSize,):Text(text,style: GoogleFonts.poppins(
        color:color==null? AppColors.green:color,
        fontSize: fontSize,
          decoration: decoration
      ),) );
}