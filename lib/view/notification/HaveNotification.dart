import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/media_query_values.dart';

class HaveNotification extends StatelessWidget {
  const HaveNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.0),

        child: ListView.separated(itemBuilder: (context, index) =>
            InkWell(
          onTap: (){},
        child: Row(
        children: [
          Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundImage:AssetImage("assets/images/No_Notification.png"),
          ),
          CircleAvatar(
            radius: 5.0,
            backgroundColor: Colors.cyan,

          )


        ],

          ),
          SizedBox(
        width: context.width*0.02,
          ),
          Column(
        children: [
          Text("Name"),
          SizedBox(
            height: context.height*0.02,
          ),
          Text("Notification Message",
              style: GoogleFonts.poppins(
                  color: Colors.grey
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
        ],
          ),
          Spacer(),
          Text("5 min ago",style: GoogleFonts.poppins(
          color: Colors.grey
          ),),
          Container(
        width: context.width*.05,
          )

        ],
        ),

      ) , separatorBuilder:(context, index) => Column(
        children: [
          SizedBox(
            height: context.height*0.05,
          ),
          Container(
              height: 1,
              color: Colors.grey.shade400,
            ),
          SizedBox(
            height: context.height*0.05,
          )
        ],
      ), itemCount: 10),
      ),
    );
  }
}
