import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

Widget Posts(searchcontroller){
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.all(20.0),
        child:  Container(
          width: double.infinity,
          height: 40,
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.2_wYPt9NQjmLngMPv9WXuQHaE8?w=270&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
                radius: 25.0,
              ),
              SizedBox(width: 5.0,),
              Expanded(
                child: CustomTextFormField(
                  hintText: 'Write something...',
                  controller: searchcontroller,
                  backgroundcolor: Colors.grey.shade200,
                  height: 40,
                  visible: false,
                ),
              ),
              IconButton(onPressed: (){}, icon:Icon(Icons.search,color: AppColors.green,)),
              SizedBox(width: 5.0,),
              IconButton(onPressed: (){}, icon:Icon(Icons.message_outlined, color: AppColors.green)),

            ],
          ),
        ),

      ),
      //posts style
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 1000,
          child: ListView.separated(itemBuilder:(context, index) =>  Card(
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
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
                Container(
                  // height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image.network( fit: BoxFit.cover,
                      "https://th.bing.com/th/id/R.64b3a43d0a4b4b4fe25522b0b18df0d4?rik=CHeho9Kiwj%2fuHw&riu=http%3a%2f%2fwww.todaysparent.com%2fwp-content%2fuploads%2f2014%2f12%2fblanket-baby-article.jpg&ehk=hjYpe9UDgyyOzbKMVnaDnHTKR7JVKJSPoEoTef426Is%3d&risl=&pid=ImgRaw&r=0",
                    )),
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
            ),
          ), separatorBuilder:(context, index) => Container(
            height: 2.0,
            color: Colors.white,
          ), itemCount: 5),
        ),
      )
    ],
  );
}
