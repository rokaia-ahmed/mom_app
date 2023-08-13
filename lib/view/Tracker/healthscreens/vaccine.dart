
import 'package:flutter/material.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/widgets/custom_icon_button.dart';
import 'package:mom_app/view/Tracker/healthscreens/vaccine_location.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/navigator.dart';
import '../../../../../../core/widgets/app_bar.dart';
import '../../../../../../core/widgets/top_screen_color_line.dart';

class Vaccine extends StatelessWidget {
  const Vaccine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: defaultAppBar(context: context,title: "Vaccination"),
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
                    height: context.height*0.03,
                  ),
                  //progress indecator
                  InkWell(
                    onTap: (){},
                    child: const Stack(
                      alignment: Alignment.center,
                      fit: StackFit.passthrough,
                      children: [
                        CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/images/baby.png'),
                        ),
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: CircularProgressIndicator(
                            strokeWidth: 10,
                            //strokeCap: StrokeCap.round,
                            // set the width of the progress indicator
                            value: 0.3, // set the completion percentage
                            backgroundColor: Colors.white, // set the background color of the progress indicator
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.green), // set the color of the progress indicator
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text("30 % vaccinated"),
                  SizedBox(height: 10.0,),
                  Text("Baby Name"),
                  SizedBox(height: 10.0,),
                  TextButton(
                    onPressed: () {
                      // AppNavigator.push(context: context,
                      //   screen:  screen,
                      // );
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
                          height: context.height*.15,
                          // padding: EdgeInsets.all(20.0),
                          // color: Colors.green,
                          child:Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //colored part
                              DecoratedBox(
                                decoration: BoxDecoration(
                                    color: AppColors.lightGreen,
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
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: 10,top: 20,bottom: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Vaccine name",style: TextStyle(
                                          color: AppColors.green
                                      )),
                                      Spacer(),
                                      Text("Age:6 months",style: TextStyle(
                                          color: Colors.green,
                                        fontSize: 12.0
                                      )),
                                    ],
                                  ),
                                ),
                              ),

                              // SizedBox(width: 5.0,),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(top: 20,bottom: 20,right: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("Done",style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 12.0
                                      ),),
                                      // Icon(
                                      //   Icons.done,
                                      //   size: 16, // set the size of the checkmark icons
                                      //   color: Colors.blue, // set the color of the checkmark icons
                                      // )
                                      Spacer(),
                                      Text("Due date:31/12/2023",style: TextStyle(
                                          color: AppColors.green,
                                          fontSize: 12.0
                                      )),
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                      ),
                    ) ,
                  ),
                  TextButton(
                    onPressed: () {
                      // AppNavigator.push(context: context,
                      //   screen:  screen,
                      // );
                    },
                    child:DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.lightGreen,
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
                        height: context.height*.15,
                        // padding: EdgeInsets.all(20.0),
                        // color: Colors.green,
                        child:Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            SizedBox(
                              width: context.width*0.02,
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 10,top: 20,bottom: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Vaccine name",style: TextStyle(
                                        color: AppColors.green
                                    )),
                                    Spacer(),
                                    Text("Age:6 months",style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 12.0
                                    )),
                                  ],
                                ),
                              ),
                            ),

                            // SizedBox(width: 5.0,),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(top: 20,bottom: 20,right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("Upcoming",style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 12.0
                                    ),),
                                    // Icon(
                                    //   Icons.done,
                                    //   size: 16, // set the size of the checkmark icons
                                    //   color: Colors.blue, // set the color of the checkmark icons
                                    // )
                                    Spacer(),
                                    Text("Due date:31/12/2023",style: TextStyle(
                                        color: AppColors.green,
                                        fontSize: 12.0
                                    )),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ) ,
                  ),
                  customIconButton(onTap: (){
                    AppNavigator.push(context: context, screen: const VaccineLocation());
                  }, isIcon: true,icon: Icons.location_on_outlined,iconSize: 50.0)
                ])));
  }
}
