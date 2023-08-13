import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/navigator.dart';
import '../../notification/notification.dart';
import '../../setting/Setting.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      toolbarHeight: context.height*.18,
      backgroundColor: AppColors.green,
      leading:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){},
              child: SizedBox(
                width: 65,
                height: 50,
                child: CircleAvatar(
                    radius: 70,
                    // backgroundImage: AssetImage(''),
                    child:CircularProgressIndicator(
                      strokeWidth: 5,
                      value: 0.65, // set the completion percentage
                      backgroundColor: Colors.grey[300], // set the background color of the progress indicator
                      valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primaryColor), // set the color of the progress indicator
                    )

                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text("65%",
              style: GoogleFonts.poppins(
                  color: AppColors.primaryColor
              ),),
          ],
        ),
      ),
      title:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Yaya",style: GoogleFonts.poppins(
              color: Colors.white
          ),),
          SizedBox(
            height: context.height*0.002,
          ),
          Text("Mon, Jun 5",style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 15
          ),),
          SizedBox(
            height: context.height*0.002,
          ),
        ],
      ),
      actions: [
        InkWell(
          onTap:(){} ,
          child: const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,),
        ),
        const SizedBox(width: 10.0,),
        InkWell(
            onTap: (){
              AppNavigator.push(context: context,
                screen:const Notifications(),
              );
            },
            child: const Icon(
              Icons.notifications_none,
              color: Colors.white,)),
        const SizedBox(width: 10.0,),
        InkWell(
            onTap: (){
              AppNavigator.push(context: context,
                screen:const Setting(),
              );
            },
            child: const Icon(
              Icons.settings_outlined,
              color: Colors.white,)
        ),
        const SizedBox(width: 10.0,),
      ],
    );
  }
}
