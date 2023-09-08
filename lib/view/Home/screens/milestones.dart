import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import '../../../core/widgets/app_bar.dart';
import '../widget/build_baby_activity.dart';
import '../widget/build_red_flags_list.dart';


class Milestones extends StatelessWidget {
  const Milestones({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:defaultAppBar(
        context: context,
        title: 'milestones',
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 10,
              color:AppColors.lightGreen ,
              width:double.infinity ,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('5 months old baby',
                    style:GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ) ,
                   ),
                  const SizedBox(height: 10),
                  Image.asset('assets/images/milestone.png',
                  height: context.height*0.5,
                  width: double.infinity,
                    fit:BoxFit.cover ,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/check.png',
                        height: context.height*0.05,
                        width: context.width*0.08,
                        fit:BoxFit.cover ,
                      ),
                      const SizedBox(width:5),
                      Text('Check your baby activity',
                        style:GoogleFonts.poppins(
                          fontWeight:FontWeight.w500 ,
                          fontSize: 15,
                        ) ,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const BuildBabyActivity(),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/flag.png',
                        height: context.height*0.06,
                        width: context.width*0.08,
                        fit:BoxFit.cover ,
                      ),
                      const SizedBox(width:5),
                      Text('Red flags',
                        style:GoogleFonts.poppins(
                          fontWeight:FontWeight.w500 ,
                          fontSize: 18,
                        ) ,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const BuildRedFlagsList(),
                  const SizedBox(height: 30),
                  Text('WHO Growth Guide',
                    style:GoogleFonts.poppins(
                      color: AppColors.green,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ) ,
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap:(){
                    } ,
                    child: Row(
                      children: [
                        Text('Quick view of WHO’s baby growth',
                          style:GoogleFonts.poppins(
                            color: AppColors.green,
                            decoration:TextDecoration.underline ,
                            height: 0,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ) ,
                        ),
                        const SizedBox(width: 15,),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: AppColors.green,
                          size:23 ,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ) ,
    );
  }
}
