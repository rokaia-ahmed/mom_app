
import 'package:flutter/material.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../core/models/reminder_model.dart';
import '../layout/layout_screen.dart';
import 'Activity.dart';
import 'Growth.dart';
import 'Health.dart';
import 'baby_firsts.dart';
import 'feeding.dart';
import 'reminder.dart';

class Tracking extends StatelessWidget {
  const Tracking({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(context: context,screen: const LayoutScreen(),title: "Baby Tracker"),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:  SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                // Reminder
               // babyTrackingList(context: context,
               //      colors: AppColors.teal,
               //      icon: Icons.timer,text:"Reminder",
               //      screen: Reminder()),
                babyTrackingList(context: context,
                    colors: AppColors.teal,
                    icon: Icons.timer_outlined,text: "Reminder",screen:ReminderScreen()),
                const SizedBox(
                  height:5.0,
                ),
                //Health
                babyTrackingList(context: context,
                    colors: Colors.green.shade100,
                    icon: Icons.face,text: "Health",screen:const Health()),
                const SizedBox(
                  height:5.0,
                ),
                //Activity
                babyTrackingList(context: context,colors: Colors.orange.shade600,icon: Icons.sports_baseball,text: "Activity",screen:Activity()),
                const SizedBox(
                  height:5.0,
                ),
                //Food
                babyTrackingList(context: context,colors:AppColors.yellow,icon: Icons.fastfood_outlined,text: "Food",screen:Feeding()),
                const SizedBox(
                  height:5.0,
                ),
                //Growth
                babyTrackingList(context: context,colors: Colors.tealAccent,icon: Icons.trending_up_outlined,text: "Growth",screen:Growth()),
                const SizedBox(
                  height:5.0,
                ),
                //Baby First
                babyTrackingList(context: context,colors: AppColors.lightRed,icon: Icons.wb_incandescent_outlined,text: "Baby First",screen:BabyFirsts()),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget babyTrackingList({required BuildContext context, required colors, required icon,required text,required screen}){
    return TextButton(
      onPressed: () {
        AppNavigator.push(context: context,
          screen:  screen,
        );
      },
      child:DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(

            color: Colors.white,
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              // spreadRadius: 2,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Container(
            width:context.width,
            height: context.height*.1,
            // padding: EdgeInsets.all(20.0),
            // color: Colors.green,
            child:Row(
              children: [
                //colored part
                DecoratedBox(
                  decoration: BoxDecoration(
                      color: colors,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                      )

                  ),
                  child: Container(
                    width:context.width*.05,
                    // color: Colors.green,
                  ),
                ),
                SizedBox(
                  width: context.width*0.02,
                ),
                Icon(icon,color: AppColors.green,),
                SizedBox(
                  width: context.width*0.005,
                ),
                Text(text,style: TextStyle(
                    color: AppColors.green
                )),
                Spacer(),
                Icon(Icons.arrow_forward_ios_outlined,color: AppColors.green,),
                Container(width: context.width*.02,)


              ],
            )
          // ListTile(
          //
          //   leading: Container(
          //     width: context.width*0.15,
          //     height: double.infinity,
          //     color: Colors.green,
          //   ),
          // ),
          // color: Colors.black54,
        ),
      ) ,
    );
  }
}
