import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key,
  required this.title,
  }) : super(key: key);
 final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:AppColors.primaryColor ,
      elevation: 0,
      leading:IconButton(
        onPressed:(){
          Navigator.pop(context);
        } ,
        icon:const Icon(Icons.arrow_back_ios),
      ),
      centerTitle:true ,
      title:Text(title,
        style:GoogleFonts.poppins(),
      ) ,
    ) ;
  }
}
