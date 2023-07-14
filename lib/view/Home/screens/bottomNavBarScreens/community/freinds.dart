import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../chats.dart';

Widget friends(context){
  return Padding(
      padding:  EdgeInsets.all(20.0),
      child: Column(
          children: [
            Row(
              children: [
                Text("All Friends",style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: AppColors.green,
                  fontSize: 16,
                ),),
                Spacer(),
                IconButton(onPressed: (){}, icon:Icon(Icons.search,color: AppColors.green,)),
                SizedBox(width: 5.0,),
                IconButton(onPressed: (){

                  AppNavigator.push(context: context,
                    screen:  Chats(),
                  );
                }, icon:Icon(Icons.message_outlined, color: AppColors.green)),

              ],
            ),
            SizedBox(height: 20.0,),
            Row(
              children: [
                Text("33 Friends",style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: AppColors.green,
                    fontSize: 16
                ),),
                Spacer(),
                TextButton(onPressed: () {

                }, child: Text("see all",style: GoogleFonts.poppins(
                  // fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.green
                )),),
                // SizedBox(width: 10.0,),

              ],
            ),
            SizedBox(height: 20.0,),
            //you freinds list
            SizedBox(
              height:100*4 ,

              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
              friendsList(), separatorBuilder: (context, index) => Container(
                height: 16.0,
              ) , itemCount: 4),
            ),
            //friends requist
            Row(
              children: [
                Text("Friends Requests",style: GoogleFonts.poppins(
                  color: AppColors.green,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
                ),),
                Spacer(),
                TextButton(onPressed: (){}, child: Text("See all",style: GoogleFonts.poppins(
                  color: Colors.green,
                  fontSize: 12.0,
                ),),),
              ],
            ),
            SizedBox(height: 20.0,),
            //grid view
            SizedBox(
              height:100*3 ,
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                  friendsRequestList(), separatorBuilder: (context, index) => Container(
                height: 16.0,
              ) , itemCount: 3),
            ),
            //group style

          ]
      )
  );
}

Widget friendsList(){
  return Container(

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.white,
      border: Border.all(
        color: Colors.white,
        width: 1.0,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          offset: Offset(0, 3),
          // blurRadius: 4,
          // spreadRadius: 0,
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          InkWell(
            onTap: (){},
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.2_wYPt9NQjmLngMPv9WXuQHaE8?w=270&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
              ),
            ),
          ),
          SizedBox(width: 10.0,),
          Text("Shery Ali" ,style: GoogleFonts.poppins(
              color: AppColors.green,
              fontSize: 16.0,

          ),),
          Spacer(),
          IconButton(onPressed: (){}, icon:Icon(Icons.message_rounded,color: AppColors.primaryColor,)),
        ],
      ),
    ),
  );
}
Widget friendsRequestList(){
  return Container(

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.white,
      border: Border.all(
        color: Colors.white,
        width: 1.0,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          offset: Offset(0, 3),
          // blurRadius: 4,
          // spreadRadius: 0,
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          InkWell(
            onTap: (){},
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.2_wYPt9NQjmLngMPv9WXuQHaE8?w=270&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
              ),
            ),
          ),
          SizedBox(width: 10.0,),
          Text("Shery Ali" ,style: GoogleFonts.poppins(
            color: AppColors.green,
            fontSize: 16.0,

          ),),
          Spacer(),
    //accept friend request
          InkWell(
            onTap: (){},
            child: Container(
              // width: 200,
              // height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.green, // set the border color to green
                    width: 2, // set the border width to 2
                  ),
                ),
                child: Icon(
                  Icons.check,
                  color: AppColors.primaryColor,
                )// your widget or child here
            ),
          ),
          SizedBox(width: 20.0,),
          //reject friend request
          InkWell(
      onTap: (){},
      child: Container(
          // width: 200,
          // height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Colors.green, // set the border color to green
              width: 2, // set the border width to 2
            ),
          ),
          child: Icon(
            Icons.clear,
            color: AppColors.primaryColor,
          )// your widget or child here
      ),
    ),
          SizedBox(width: 10.0,),
        ],
      ),
    ),
  );
}