import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/utils/navigator.dart';
import 'package:mom_app/view/Home/screens/bottomNavBarScreens/babyTrackerSreens/healthscreens/medical_history.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../../../../core/widgets/top_screen_color_line.dart';
import 'baby_tracker_deafult_screens.dart';
import 'healthscreens/vaccine.dart';
class Health extends StatelessWidget {
  const Health({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context,title: "Health"),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          // scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: context.height*0.02,
            ),
            //top screen color
            topScreenColorLine(color: AppColors.lightGreen),
            SizedBox(
              height: context.height*0.005,
            ),
            healthButton(context: context,onTap: (){
              AppNavigator.push(context: context, screen: Vaccine());
            },imageName:"HealthIcon" ,text: "Vaccination"),
            healthButton(context: context,onTap: (){
              AppNavigator.push(context: context, screen: MedicalHistory());
            },imageName:"medicalHistory" ,text: "Medical History"),
            healthButton(context: context,onTap: (){},imageName:"doctor" ,text: "Call a doctor"),
            SizedBox(height: 20,),
            ])));

  }
  Widget healthButton({required BuildContext context,required onTap,required String imageName,required String text}){
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 20,left: 20,top: 10,bottom: 10),
        child: Container(
          height: context.height*0.1,
          width: double.infinity,
          padding:EdgeInsets.all(10.0),
          decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: AppColors.lightGreen, // set the color of the border here
              width: 1, // set the width of the border here
            ),
          ),
          child:   Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/${imageName}.png'),width: 30),
              Text(text,style: GoogleFonts.poppins(
                  color: AppColors.green,
                  fontSize: 20
              ),)
            ],
          ),
        ),
      ),
    );
  }
}