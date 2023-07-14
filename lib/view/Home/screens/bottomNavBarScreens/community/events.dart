
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/navigator.dart';
import '../../chats.dart';

Widget event(context){
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        Row(
          children: [
            Text("All Events",style: GoogleFonts.poppins(
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
            Text("Up Coming Events",style: GoogleFonts.poppins(
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
        //Event card
        SizedBox(
          height: 335*5,
          child: ListView.separated(itemBuilder: (context, index) => EventCard(), separatorBuilder: (context,index)=>
              Container(
            height: 10.0,
          ), itemCount: 5),
        ),
  ],
  ),

  );
}

Widget EventCard(){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade200,
          // spreadRadius: 5,
          blurRadius: 3,
          // offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Play date, let's play together",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: AppColors.green,
                fontSize: 16
            ),
            maxLines: 1,
            overflow:TextOverflow.ellipsis,
          ),
          SizedBox(height: 10.0,),
          Row(
            children: [
              Text("Central Garden",
                style: GoogleFonts.poppins(

                    color: AppColors.green,
                    fontSize: 14.0
                ),
                maxLines: 1,
                overflow:TextOverflow.ellipsis,
              ),
              Spacer(),
              Text("Fri, 8 JUL AT 10 am",
                style: GoogleFonts.poppins(

                    color: Colors.green,
                    fontSize: 14.0
                ),
                maxLines: 1,
                overflow:TextOverflow.ellipsis,
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network("https://th.bing.com/th/id/OIP.2_wYPt9NQjmLngMPv9WXuQHaE8?w=270&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
          ),
          SizedBox(height: 7.0,),
          Row(
            children: [
              Container(
                height: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.primaryColor,
                ),
                child: InkWell(
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.access_alarm_outlined,color: Colors.white,),
                        SizedBox(width: 5.0,),
                        Text("Set Reminder",
                          style: GoogleFonts.poppins(

                              color: Colors.white,
                              fontSize: 14.0
                          ),
                          maxLines: 1,
                          overflow:TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.share_outlined,color: AppColors.green,)),
            ],
          ),


        ],
      ),
    ),
  );

}