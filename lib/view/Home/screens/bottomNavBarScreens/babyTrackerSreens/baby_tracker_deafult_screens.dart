import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/media_query_values.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../../../../core/widgets/overlay_entry_card.dart';

Widget babyTrackerDeafultScreens({required BuildContext context ,required bool image,required color,required String appBarText,required  icon,required String description,required String title}){
  return Scaffold(
    appBar: defaultAppBar(context: context,title: appBarText),
    backgroundColor: Colors.white,
    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        // scrollDirection: Axis.vertical,
        children: [
          Container(
            height: 10.0,
            decoration:  BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                )
            ),
          ),
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
                  color: AppColors.teal, // set the color of the border here
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
                        backgroundColor: AppColors.teal,
                        child: Center(child: Icon(icon,size: 40.0,color: AppColors.green,)),
                      ),
                      SizedBox(width: 10.0,),
                      Text(title,style: GoogleFonts.poppins(
                          color: AppColors.green,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold
                      )),
                      Spacer(),
                      IconButton(onPressed: (){
                        overlayEntryCard(context: context,color:color);
                      }, icon:Icon(Icons.create_outlined,color:AppColors.green,)),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  image? Image.network("https://th.bing.com/th/id/R.8e220cdb5a70a3c9376685d35509a7e0?rik=9INY0TSzHLNjOw&pid=ImgRaw&r=0",
                  width: double.infinity,
                    height:context.height*0.25,
                    fit: BoxFit.cover,
                  ): SizedBox(height: 0.0,),
                  SizedBox(height: 10.0,),
                  Text(description,style: GoogleFonts.poppins(
                    color: AppColors.green,
                    fontSize: 12.0,
                  ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

          ),
          SizedBox(height: 10.0,),
          Center(
            child: InkWell(
              onTap: (){
                overlayEntryCard(context: context,color:color);
              },
              child: CircleAvatar(
                radius: 20.0,
                backgroundColor: color,
                child: Icon(Icons.add,size: 40.0,color: Colors.white,),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}