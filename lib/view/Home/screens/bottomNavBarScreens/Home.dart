
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/view/Home/screens/setting/Setting.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/navigator.dart';
import '../../notification/notification.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: context.height*.2,
        backgroundColor: AppColors.green,
        leading:SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){},
                  child: Container(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                     radius: 50,
                     // backgroundImage: AssetImage(''),
                     child:CircularProgressIndicator(
                       strokeWidth: 5,
                       // set the width of the progress indicator
                       value: 0.65, // set the completion percentage
                       backgroundColor: Colors.grey[300], // set the background color of the progress indicator
                       valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor), // set the color of the progress indicator
                     )

                        ),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text("65%",style: GoogleFonts.poppins(
                  color: AppColors.primaryColor
                ),),
              ],
            ),
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
            Text("Thank you Mama for tacking care of me",style: GoogleFonts.poppins(
                color: Colors.white,
              fontSize: 15
            ),),
          ],
        ),
        actions: [
          IconButton(onPressed: (){
            AppNavigator.push(context: context,
              screen:Notifications(),
            );
          }, icon: Icon(Icons.notifications_none,color: Colors.white,)),
          IconButton(onPressed: (){
            AppNavigator.push(context: context,
              screen:Setting(),
            );
          }, icon: Icon(Icons.settings_outlined,color: Colors.white,)),
          SizedBox(width: 10.0,),
        ],
      ),
      body: Center(
        child: Text("home Screen",style: TextStyle(
          color: AppColors.primaryColor,
        ),),
      ),
    );
  }
}
