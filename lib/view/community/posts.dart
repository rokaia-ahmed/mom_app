
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/navigator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_icon_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../chat/chats.dart';

Widget Posts({required BuildContext context,required TextEditingController searchController}){
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.all(20.0),
        child:  Container(
          width: double.infinity,
          height: 30,
          child: Row(
            children: [
              //profile image
              const CircleAvatar(
                backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.2_wYPt9NQjmLngMPv9WXuQHaE8?w=270&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
                radius: 18.0,
              ),
              SizedBox(width: 5.0,),
              //search field
              Expanded(
                child:  CustomTextFormField(
                  hintText: 'Write something...',
                  controller: searchController,
                  backGroundColor: Colors.grey.shade200,
                  // height: 40,
                  visible: false,
                ),
              ),
              SizedBox(width: 5.0,),
              //search icon
              customIconButton(isIcon: true, icon:Icons.search_outlined,onTap: (){}),
              SizedBox(width: 5.0,),
              //message icon
              customIconButton(isIcon: true, icon:Icons.message_outlined,onTap: (){
                AppNavigator.push(context: context, screen: Chats());
              }),
            ],
          ),
        ),
      ),
      //posts style
      Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20.0),
        child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder:(context, index) =>  Card(
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child:postCard() ,
        ), separatorBuilder:(context, index) => Container(
          height: 2.0,
          color: Colors.white,
        ), itemCount: 5),
      )
    ],
  );
}
Widget postCard(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 5.0),
      Container(

        width: double.infinity,
        height: 50,

        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.2_wYPt9NQjmLngMPv9WXuQHaE8?w=270&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
              radius: 35.0,
            ),
            SizedBox(width: 5.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Shery Ali",style:GoogleFonts.poppins(
                    color: AppColors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),),
                Spacer(),
                Text("1 hour ago",style: GoogleFonts.poppins(
                  color: Colors.green,
                  fontSize: 10,
                ),)
              ],
            ),
            Spacer(),
            IconButton(onPressed: (){}, icon:Icon(Icons.more_vert_outlined,color: AppColors.green,)),
          ],
        ),
      ),
      SizedBox(height: 20.0),
      Text("Good morning Every one",style:GoogleFonts.poppins(
        color: AppColors.green,
        fontSize: 16,
      ),),
      SizedBox(height: 10.0),
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network( fit: BoxFit.cover,
          "https://th.bing.com/th/id/R.64b3a43d0a4b4b4fe25522b0b18df0d4?rik=CHeho9Kiwj%2fuHw&riu=http%3a%2f%2fwww.todaysparent.com%2fwp-content%2fuploads%2f2014%2f12%2fblanket-baby-article.jpg&ehk=hjYpe9UDgyyOzbKMVnaDnHTKR7JVKJSPoEoTef426Is%3d&risl=&pid=ImgRaw&r=0",
        ),
      ),
      SizedBox(height: 10.0),
      //comment share love icons
      Row(
        children: [
          IconButton(onPressed: (){}, icon:Icon(Icons.favorite_border_outlined,color: AppColors.green,)),
          SizedBox(height: 10.0),
          IconButton(onPressed: (){}, icon:Icon(Icons.comment_outlined,color: AppColors.green,)),
          SizedBox(height: 10.0),
          IconButton(onPressed: (){}, icon:Icon(Icons.share_outlined,color: AppColors.green,)),
          Spacer(),
          IconButton(onPressed: (){}, icon:Icon(Icons.bookmark,color: Colors.orange,)),
        ],
      ),
      SizedBox(height: 10.0),
      Text("2,894 Likes",style:GoogleFonts.poppins(
        color: AppColors.green,
        fontSize: 14,
      ),),
    ],
  );
}
