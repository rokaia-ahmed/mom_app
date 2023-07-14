import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/navigator.dart';
import 'home_screen.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    appBar:AppBar(
        title: const Center(
         child: Text("Community",style: TextStyle(

  ),),
  ),
        leading: IconButton( onPressed: () {
        AppNavigator.push(context: context,
        screen:  HomeScreen(),
  );
  },
         icon:Icon( Icons.arrow_back_ios)),
  ),
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
                IconButton(onPressed: (){}, icon:Icon(Icons.search,color: AppColors.green,)),
                SizedBox(width: 5.0,),
                IconButton(onPressed: (){}, icon:Icon(Icons.message, color: AppColors.green)),

              ],
            ),
          ),
          //Chat list
          Expanded(
            child: ListView.separated(itemBuilder: (context, index) => chatList() , separatorBuilder: (context,index)=> Container(
              color: Colors.grey.shade200,
              height: 1.0,
            ), itemCount: 10),
          )


        ],
      ),
    );
  }
  Widget chatList(){
    return InkWell(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.all(20.0),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Shery Ali" ,style: GoogleFonts.poppins(
                  color: AppColors.green,
                  fontSize: 16.0,

                ),),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [


                  ],
                ),
                Text("How is your baby todat?" ,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    color: Colors.green,
                    fontSize: 12.0,

                  ),),
              ],
            ),
            Spacer(),
            Text("2 hours ago" ,style: GoogleFonts.poppins(
              color: Colors.green,
              fontSize: 12.0,

            ),),

            //accept friend request

          ],
        ),
      ),
    );
  }

}
