import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/view/Home/screens/babyTrackerSreens/reminder.dart';
import 'package:mom_app/view/Home/screens/home_screen.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/navigator.dart';
import 'Home.dart';

class Tracking extends StatelessWidget {
  const Tracking({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text("Baby Tacker",style: TextStyle(

          ),),
        ),
        leading: IconButton( onPressed: () {
          AppNavigator.push(context: context,
            screen:  HomeScreen(),
          );
        }, icon:Icon( Icons.arrow_back_ios)),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:  SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              // scrollDirection: Axis.vertical,
              children: [
                SizedBox(
                  height: context.height*0.05,
                ),
                //Reminder
                TextButton(
                  onPressed: () {
                    AppNavigator.push(context: context,
                      screen:  Reminder(),
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
                          blurRadius: 5,
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
                            DecoratedBox(

                              decoration: BoxDecoration(
                                  color: Colors.cyanAccent.shade400,
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
                            Icon(Icons.timer,color: AppColors.green,),
                            SizedBox(
                              width: context.width*0.005,
                            ),
                            Text("Reminder",style: TextStyle(
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
                //Activity
                TextButton(
                  onPressed: () {  },
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
                          blurRadius: 5,
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
                            DecoratedBox(

                              decoration: BoxDecoration(
                                  color: Colors.orange.shade600,
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
                            Icon(Icons.sports_baseball,color: AppColors.green,),
                            SizedBox(
                              width: context.width*0.005,
                            ),
                            Text("Activity",style: TextStyle(
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
                //Health
                TextButton(
                  onPressed: () {  },
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
                          blurRadius: 5,
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
                            DecoratedBox(

                              decoration: BoxDecoration(
                                  color: Colors.greenAccent.shade200,
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
                            Icon(Icons.face,color: AppColors.green,),
                            SizedBox(
                              width: context.width*0.005,
                            ),
                            Text("Health",style: TextStyle(
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
                //Food
                TextButton(
                  onPressed: () {  },
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
                          blurRadius: 5,
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
                            DecoratedBox(

                              decoration: BoxDecoration(
                                  color: Colors.yellowAccent,
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
                            Icon(Icons.fastfood_outlined,color: AppColors.green,),
                            SizedBox(
                              width: context.width*0.005,
                            ),
                            Text("Food",style: TextStyle(
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
                //Growth
                TextButton(
                  onPressed: () {  },
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
                          blurRadius: 5,
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
                            DecoratedBox(

                              decoration: BoxDecoration(
                                  color: Colors.cyanAccent.shade400,
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
                            Icon(Icons.trending_up_outlined,color: AppColors.green,),
                            SizedBox(
                              width: context.width*0.005,
                            ),
                            Text("Growth",style: TextStyle(
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
                //Baby First
                TextButton(
                  onPressed: () {  },
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
                          blurRadius: 5,
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
                            DecoratedBox(

                              decoration: BoxDecoration(
                                  color: Colors.redAccent.shade100,
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
                            Icon(Icons.wb_incandescent_outlined,color: AppColors.green,),
                            SizedBox(
                              width: context.width*0.005,
                            ),
                            Text("Baby First",style: TextStyle(
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


              ],
            ),
          ),
        ),
      ),
    );
  }
}
Widget BabyTackingList(context,  colors,icon,text){
  return TextButton(
    onPressed: () {  },
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
            blurRadius: 5,
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