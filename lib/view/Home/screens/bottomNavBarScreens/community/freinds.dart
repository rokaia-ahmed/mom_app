

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/navigator.dart';
import 'package:mom_app/view/Home/chat/chats.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_icon_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

Widget friends({required BuildContext context}){
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
                customIconButton(isIcon: true,icon: Icons.search_outlined,onTap: (){}),
                SizedBox(width: 5.0,),
                customIconButton(isIcon: true,icon: Icons.message_outlined,onTap: (){
                  AppNavigator.push(context: context, screen: Chats());
                }),
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
                customIconButton(isIcon: false,text: "see all",fontSize: 12.0,color: AppColors.primaryColor,onTap: (){}),
                // SizedBox(width: 10.0,),

              ],
            ),
            SizedBox(height: 20.0,),
            //you freinds list
            ListView.separated(
              shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
            friendsList(), separatorBuilder: (context, index) => Container(
              height: 16.0,
            ) , itemCount: 4),
            SizedBox(height: 20.0,),
            //friends requist
            Row(
              children: [
                Text("Friends Requests",style: GoogleFonts.poppins(
                  color: AppColors.green,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
                ),),
                Spacer(),
                customIconButton(isIcon: false,text: "see all",fontSize: 12.0,color: AppColors.primaryColor,onTap: (){}),
              ],
            ),
            SizedBox(height: 20.0,),
            //grid view
            ListView.separated(
              shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                friendsRequestList(), separatorBuilder: (context, index) => Container(
              height: 16.0,
            ) , itemCount: 3),
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
          offset: Offset(0, 1),
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
            child: const CircleAvatar(
              radius: 18.0,
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
          customIconButton(isIcon: true, icon:Icons.message_rounded,color: AppColors.primaryColor,onTap: (){}),
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
          offset: Offset(0, 1),
          // blurRadius: 4,
          // spreadRadius: 0,
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          //image
          InkWell(
            onTap: (){},
            child: CircleAvatar(
              radius: 18.0,
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
          customIconButton(isIcon: true, icon:Icons.check_circle_outline,color: AppColors.primaryColor,onTap: (){}),
          SizedBox(width: 10.0,),
          //reject friend request
          customIconButton(isIcon: true, icon:Icons.highlight_remove,color: AppColors.primaryColor,onTap: (){}),
          SizedBox(width: 10.0,),
        ],
      ),
    ),
  );
}