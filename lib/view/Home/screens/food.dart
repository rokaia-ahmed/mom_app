import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import '../../../core/widgets/app_bar.dart';
import '../widget/build_baby_activity.dart';
import '../widget/build_red_flags_list.dart';


class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:defaultAppBar(
        context: context,
        title: 'Food',
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 10,
              color:AppColors.orange ,
              width:double.infinity ,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('as your baby now is 5 months, he \n'
                       'may  ready to try solid food',
                    style:GoogleFonts.poppins(
                      fontSize: 15,
                      color: AppColors.orange,
                    ) ,
                  ),
                  const SizedBox(height: 10),
                  Text('looking for the following signs',
                    style:GoogleFonts.poppins() ,),
                  const BuildRedFlagsList(),
                  const SizedBox(height: 10),
                  Image.asset('assets/images/food1.png',
                    height: context.height*0.4,
                    width: double.infinity,
                    fit:BoxFit.contain ,
                  ),
                  const SizedBox(height: 10),
                  Image.asset('assets/images/food2.png',
                    height: context.height*0.5,
                    width: double.infinity,
                    fit:BoxFit.contain ,
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
