import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/widgets/app_bar.dart';
import 'package:mom_app/view/Home/chat/personal%20chat.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/navigator.dart';
import '../../../core/widgets/custom_icon_button.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    appBar: defaultAppBar(context: context, title: "Chats"),
      body: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 1,
            color: Colors.grey.shade200,
          ),
          //chat and search icon
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text("Chats",style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: AppColors.green,
                  fontSize: 16,
                ),),
                Spacer(),
                customIconButton(isIcon: true, icon:Icons.search_outlined,onTap: (){}),
                SizedBox(width: 5.0,),
                customIconButton(isIcon: true, icon:Icons.message,onTap: (){
                }),
              ],
            ),
          ),
          //Chat list
          Expanded(
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => chatList(context: context) , separatorBuilder: (context,index)=> Container(
              color: Colors.grey.shade100,
              height: 1.0,
            ), itemCount: 10),
          )
        ],
      ),
    );
  }
  Widget chatList({required BuildContext context}){
    return InkWell(
      onTap: (){
        AppNavigator.push(context: context, screen: PersonalChatScreen(chatPartnerName: 'Galal', chatPartnerAvatarUrl: 'https://www.bing.com/images/search?view=detailV2&ccid=GtsqfRQo&id=18131CC809C69A09773F4447A0693446FB100936&thid=OIP.GtsqfRQoY6FNkk6qzZvcYwHaLH&mediaurl=https%3a%2f%2fthumbs.dreamstime.com%2fb%2fman-portrait-13174532.jpg&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.1adb2a7d142863a14d924eaacd9bdc63%3frik%3dNgkQ%252b0Y0aaBHRA%26pid%3dImgRaw%26r%3d0&exph=900&expw=600&q=man&simid=608043227933405114&FORM=IRPRST&ck=89412F34B13959D761C0ECD92A4B5364&selectedIndex=25',));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20.0,bottom: 10.0,top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Shery Ali" ,style: GoogleFonts.poppins(
                  color: AppColors.green,
                  fontSize: 16.0,
                ),),
                SizedBox(height: 5.0,),
                Text("How is your baby today?" ,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    color: AppColors.primaryColor,
                    fontSize: 10.0,

                  ),),
              ],

            ),
            Spacer(),
            Text("2 hours ago" ,style: GoogleFonts.poppins(
              color: AppColors.primaryColor,
              fontSize: 10.0,
            ),),
          ],
        ),
      ),
    );
  }

}
