import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/utils/navigator.dart';
import 'package:mom_app/view/Home/screens/food.dart';
import '../../../../../core/utils/app_colors.dart';
import '../widget/Build_new_Skils.dart';
import '../widget/build_active_reminder_list.dart';
import '../widget/build_foot_list.dart';
import '../widget/build_mid_container.dart';
import '../widget/custom_app_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(context.height * .18),
          child: const CustomAppBar(),
        ),
        body: ListView(
          padding: const EdgeInsets.all(15),
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
                  'Hello Mom,',
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    color: AppColors.orange,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Text(
              'Thank you For Taking Care Of Me ',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColors.orange,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: context.height * 0.08,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.yellow,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/Vector.png',
                    height: 25,
                    width: 25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Up coming vaccination in 2 days. ',
                    style: GoogleFonts.poppins(
                        //  fontSize: 18,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Your active reminder',
                style:GoogleFonts.poppins(
                  fontSize: 16,
                ) ,
                ),
                Text('see all',
                  style:GoogleFonts.poppins(
                    color: AppColors.orange
                  ) ,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const BuildActiveReminderList(),
            const SizedBox(
              height: 10,
            ),
            const BuildMidContainer(),
             SizedBox(
              height: context.height*0.04,
            ),
             Row(
              children: [
                Text(
                  ' Your baby now can eat',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: context.width * 0.02,
                ),
                Image.asset(
                  'assets/images/flower.png',
                  height: 30,
                  width: 30,
                  fit: BoxFit.cover,
                ),

              ],
            ),
             SizedBox(
              height: context.height*0.02,
            ),
             BuildFootList(),
             SizedBox(
              height: context.height*0.01,
            ),
             InkWell(
              onTap:(){
                AppNavigator.push(context: context,
                    screen: const FoodScreen());
              } ,
              child: Row(
                children: [
                  Text('Get more information about baby food',
                    style:GoogleFonts.poppins(
                      color: AppColors.orange,
                      height: 0,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ) ,
                  ),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    color: AppColors.orange,
                    size:20 ,
                  )
                ],
              ),
            ),
            SizedBox(
              height: context.height*0.05,
            ),
             const BuildNewSkills(),
          ],
        ),
    );
  }
}
