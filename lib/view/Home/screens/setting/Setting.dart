
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
                Row(
                  children: [
                    SizedBox(
                      width: context.width*0.30,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                           InkWell(
                             onTap: (){},
                             child: const CircleAvatar(
                              radius: 50.0,
                              backgroundColor: Colors.green, // sets the background color of the circle
                              backgroundImage: AssetImage('assets/images/baby.png') ,
                             // sets the icon for the circle
                          ),
                           ),
                          SizedBox(
                            height: context.height*0.05,
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
                    SizedBox(
                      width: context.width*0.1,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: (){},
                            child: const CircleAvatar(
                              radius: 50.0,
                              backgroundColor: Colors.green, // sets the background color of the circle
                              backgroundImage: AssetImage('assets/images/baby.png') ,
                             ),// sets the icon for the circle
                            ),

                          SizedBox(
                            height: context.height*0.05,
                          ),
                           Text("Parent Profile",style: GoogleFonts.poppins(
                             color: Colors.orange
                           ),),

                        ],
                      ),
                    ),
                    SizedBox(
                      width: context.width*0.30,
                    ),

                  ],
                ),
                SizedBox(
                  height: context.height*0.05,
                ),

                //change password
                InkWell(
                  onTap: () {  },
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
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Container(
                        width:context.width,
                        height: context.height*.1,
                        // color: Colors.green,
                        child:Row(
                          children: [
                            SizedBox(
                              width: context.width*0.02,
                            ),
                             Text("Change Password",style: GoogleFonts.poppins(
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
                ),
                SizedBox(
                  height: context.height*0.05,
                ),
                //English
                InkWell(
                  onTap: () {  },
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
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Container(
                        width:context.width,
                        height: context.height*.1,
                        // color: Colors.green,
                        child:Row(
                          children: [
                            SizedBox(
                              width: context.width*0.02,
                            ),
                            Text("English",style: GoogleFonts.poppins(
                                color: AppColors.green
                            )),



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
                ),
                SizedBox(
                  height: context.height*0.05,
                ),
                //Help & Contact
                InkWell(
                  onTap: () {  },
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
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Container(
                        width:context.width,
                        height: context.height*.1,
                        // color: Colors.green,
                        child:Row(
                          children: [
                            SizedBox(
                              width: context.width*0.02,
                            ),
                            Text("Help & Contact",style: GoogleFonts.poppins(
                                color: AppColors.green
                            )),



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
                ),
                SizedBox(
                  height: context.height*0.05,
                ),
                //Log Out
                InkWell(
                  onTap: () {
                    AppNavigator.push(context: context,
                        screen:  SignInScreen());
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
                          color: Colors.grey.withOpacity(0.3),
                          // spreadRadius: 2,
                          // blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Container(
                        width:context.width,
                        height: context.height*.1,
                        // color: Colors.green,
                        child:Row(
                          children: [
                            SizedBox(
                              width: context.width*0.02,
                            ),
                            Text("Log Out",style: GoogleFonts.poppins(
                                color: AppColors.green
                            )),



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
                ),
                SizedBox(
                  height: context.height*0.05,
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
                    width: context.width,
                    height: context.height*0.1,
                    // color: Colors.orange,
                    child: TextButton(onPressed: (){}, child: Text("Add New Baby  +",style: GoogleFonts.poppins(
                      color: AppColors.green,
                      fontSize: 30
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
}
