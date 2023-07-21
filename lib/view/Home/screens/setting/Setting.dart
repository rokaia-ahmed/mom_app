
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/widgets/app_bar.dart';
import 'package:mom_app/view/layout/layout_screen.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/navigator.dart';
import '../../../register/screens/signin_screen.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(context: context, title: "Setting"),
      body:  SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                           InkWell(
                             onTap: (){},
                             child: const CircleAvatar(
                              radius: 45.0,
                              backgroundColor: Colors.green, // sets the background color of the circle
                              backgroundImage: AssetImage('assets/images/baby.png') ,
                             // sets the icon for the circle
                          ),
                           ),
                          SizedBox(
                            height:10.0,
                          ),
                          Text(
                            'Baby Profile',
                            style: GoogleFonts.poppins(
                              color: Colors.orange,
                            ),
                          ),

                        ],
                      ),
                    ),
                    // SizedBox(
                    //   width:20.0,
                    // ),
                    Expanded(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: (){},
                            child: const CircleAvatar(
                              radius: 45.0,
                              backgroundColor: Colors.green, // sets the background color of the circle
                              backgroundImage: AssetImage('assets/images/baby.png') ,
                             ),// sets the icon for the circle
                            ),

                          SizedBox(
                            height:10,
                          ),
                           Text("Parent Profile",style: GoogleFonts.poppins(
                             color: Colors.orange
                           ),),

                        ],
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: context.height*0.05,
                ),

                //change password
                settingButtons(context: context,isIcon: true,onTap: (){},text: "Change Password"),
                SizedBox(
                  height:10.0,
                ),
                //English
                settingButtons(context: context,onTap: (){},text: "English"),
                SizedBox(
                  height: 10,
                ),
                //Help & Contact
                settingButtons(context: context,onTap: (){},text: "Help & Contact"),
                SizedBox(
                  height: 10,
                ),
                //Log Out
                settingButtons(context: context,onTap: (){
                  AppNavigator.pushAndRemove(context: context, screen:SignInScreen());
                },text: "Log Out"),
                SizedBox(
                  height:10,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  child: Container(
                    width:double.infinity,
                    height: 50,
                    padding: EdgeInsets.all(0),
                    // color: Colors.orange,
                    child: TextButton(onPressed: (){}, child: Text("Add New Baby  +",style: GoogleFonts.poppins(
                      color: AppColors.green,
                      fontSize: 25
                    ),)),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget settingButtons({required BuildContext context,required String text,required onTap,isIcon=false}){
    return InkWell(
      onTap: onTap,
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
              color: Colors.grey.withOpacity(0.3),
              // spreadRadius: 2,
              // blurRadius: 5,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Container(
            width:double.infinity,
            height: 50,
            // color: Colors.green,
            padding: EdgeInsets.only(left: 10,right: 10.0),
            child:Row(
              children: [
                Text(text,style: GoogleFonts.poppins(
                    color: AppColors.green
                )),
                Spacer(),
                isIcon? Icon(Icons.arrow_forward_ios_outlined,color: AppColors.green,):SizedBox(),


              ],
            )
        ),
      ) ,
    );
  }
}
