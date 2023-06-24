import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin:const EdgeInsets.only(left: 25),
            height:1 ,
            color:Colors.white ,
          ),
        ),
        Text(
          'Or continue with',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Container(
            margin:const EdgeInsets.only(right: 25),
            height:1 ,
            color:Colors.white ,
          ),
        ),
      ],
    );
  }
}
