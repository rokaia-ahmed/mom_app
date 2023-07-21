import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/media_query_values.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../../../../core/widgets/custom_icon_button.dart';
import '../../../../../core/widgets/overlay_entry_card.dart';
import '../../../../../core/widgets/top_screen_color_line.dart';

Widget babyTrackerDeafultScreens({required BuildContext context ,required bool image,
  required color,required String appBarText,required  icon,
  required String description1,required String title,required bool isDated,
    required onTap,description2}){
  return Scaffold(
    appBar: defaultAppBar(context: context,title: appBarText),
    backgroundColor: Colors.white,
    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        // scrollDirection: Axis.vertical,
        children: [
          //top screen color
          topScreenColorLine(color:color),
          SizedBox(
            height: context.height*0.05,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              padding:EdgeInsets.all(10.0),
              decoration:  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: color, // set the color of the border here
                  width: 1, // set the width of the border here
                ),
              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 15.0,
                        backgroundColor: color,
                        child: Center(child: Icon(icon,size: 30.0,color: Colors.black,)),
                      ),
                      SizedBox(width: 10.0,),
                      Text(title,style: GoogleFonts.poppins(
                          color: AppColors.green,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold
                      )),
                      Spacer(),
                      customIconButton(isIcon: true,icon: Icons.create_outlined,onTap: (){}),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  image? Image.network("https://th.bing.com/th/id/R.8e220cdb5a70a3c9376685d35509a7e0?rik=9INY0TSzHLNjOw&pid=ImgRaw&r=0",
                  width: double.infinity,
                    height:context.height*0.25,
                    fit: BoxFit.cover,
                  ): SizedBox(height: 0.0,),
                  SizedBox(height: 10.0,),

                  isDated?Row(
                    children: [
                      Text(description1,style: GoogleFonts.poppins(
                        color: AppColors.green,
                        fontSize: 12.0,
                      ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Spacer(),
                      Text("18/6/2023",style:GoogleFonts.poppins(
                        color: AppColors.green,
                        fontSize: 12.0,
                      ) ,)
                    ],
                  ): Text(description1,style: GoogleFonts.poppins(
                    color: AppColors.green,
                    fontSize: 12.0,
                  ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  isDated?SizedBox(height: 10.0,):SizedBox(height: 0.0,),

            isDated?Row(
              children: [
                Text(description2,style: GoogleFonts.poppins(
                  color: AppColors.green,
                  fontSize: 12.0,
                ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Spacer(),
                Text("12:35 pm",style:GoogleFonts.poppins(
                  color: AppColors.green,
                  fontSize: 12.0,
                ) ,)
              ],
            ):SizedBox(height: 0.0,),
                ],
              ),
            ),

          ),
          SizedBox(height: 10.0,),
          Center(
            child: InkWell(
              onTap:onTap,
              child: Icon(Icons.add_circle,size: 40.0,color: color,),
            ),
          ),
        ],
      ),
    ),
  );
}