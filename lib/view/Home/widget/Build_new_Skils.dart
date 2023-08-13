import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import '../../../../../core/utils/app_colors.dart';

class BuildNewSkills extends StatelessWidget {
  const BuildNewSkills({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/images/flower.png',
              height: 30,
              width: 30,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: context.width * 0.03,
            ),
            Text(
              'New skill to learn',
              style: GoogleFonts.poppins(
                fontSize: 22,
                color: AppColors.orange,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(
          height: context.height*0.01,
        ),
        Text('Let’s get your baby ROLLING!',
         style:GoogleFonts.poppins(
           color: AppColors.green,
           fontSize: 14,
           fontWeight: FontWeight.w500,
         ) ,
        ),
        Text('These types of rolls are appropriate for 5-8 months!',
         style:GoogleFonts.poppins(
           color: AppColors.green,
           fontSize: 12,
         ) ,
        ),
        SizedBox(
          height: context.height*0.02,
        ),
        GestureDetector(
          onTap:(){} ,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(15),
                ) ,
                child:Image.asset('assets/images/Rectangle9.png',
                ) ,
              ),
              Image.asset('assets/images/Vector2.png') ,
            ],
          ),
        ),
        SizedBox(
          height: context.height*0.05,
        ),
      ],
    );
  }
}
