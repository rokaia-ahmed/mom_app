import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/utils/navigator.dart';
import 'package:mom_app/view/Home/screens/milestones.dart';

class BuildMidContainer extends StatelessWidget {
  const BuildMidContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color:const Color(0xff8EE2BD),
        borderRadius: BorderRadius.circular(12),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const SizedBox(
                   height: 10,
                 ),
                 Text('Yaya now is 5 month old',
                   style:GoogleFonts.poppins(
                     color: AppColors.green,
                     fontSize: 16,
                     fontWeight: FontWeight.w700,
                   ) ,
                 ),
                 const SizedBox(
                   height: 5,
                 ),
                 Text('Good job mama!',
                   style:GoogleFonts.poppins(
                     color: AppColors.green,
                     fontSize: 20,
                     fontWeight: FontWeight.w800,
                   ) ,
                 ),
                 const SizedBox(
                   height: 3,
                 ),
               ],
             ),
             Image.asset('assets/images/mother.png',
              height:context.height*0.11 ,
               width:context.width*0.3,
              fit: BoxFit.contain,
             )
            ],
          ),
          Text('Your 5-month-old is becoming\n'
              'more active and personable each day',
            maxLines: 3,
            style:GoogleFonts.poppins(
              color: AppColors.green,
              fontSize: 14,
              // fontWeight: FontWeight.w800,
            ) ,
          ),
          InkWell(
            onTap:(){
              AppNavigator.push(
                  context: context,
                  screen: const Milestones());
            } ,
            child: Row(
              children: [
                Text('know about 5 months milestones',
                  style:GoogleFonts.poppins(
                    color: Colors.white,
                    height: 0,
                    fontSize: 16,
                     fontWeight: FontWeight.w600,
                  ) ,
                ),
                const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size:20 ,
                )
              ],
            ),
          ),
          Container(
            height: 2,
            color:Colors.white ,
            width:context.width*0.81 ,
          ),
        ],
      ) ,
    );
  }
}
