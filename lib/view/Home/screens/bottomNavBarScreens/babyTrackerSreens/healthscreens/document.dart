import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/widgets/add_button.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/widgets/custom_icon_button.dart';

class Document extends StatelessWidget {
  const Document({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) =>
              documentCard(), separatorBuilder: (context, index) => Container(
        height: 16.0,
      ) , itemCount: 3),
        SizedBox(height: 20.0),
        Icon(Icons.drive_folder_upload,size: 50,color: AppColors.green,),
        addButton(context: context, text: "Upload Document", color:AppColors.lightGreen,textcolor: AppColors.green)
    
      ],
    );
  }
  Widget documentCard(){
  return InkWell(
    onTap: (){},
    child: Padding(
      padding: const EdgeInsets.only(right: 20.0,left: 20),
      child: Container(
        padding: EdgeInsets.all(10.0),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 40.0,
              width: 40,
              child:
              Image.network("https://th.bing.com/th/id/OIP.2_wYPt9NQjmLngMPv9WXuQHaE8?w=270&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
                fit: BoxFit.cover,),
            ),
            SizedBox(width: 10.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Bloody picture analysis" ,style: GoogleFonts.poppins(
                    color: AppColors.green,
                    fontSize: 14.0
                ),),
                Text("23 may",style: GoogleFonts.poppins(
                    color: Colors.green,
                    fontSize: 10.0
                ),),
              ],
            ),
            Spacer(),
            Text("23 may",style: GoogleFonts.poppins(
                color: Colors.green,
                fontSize: 10.0
            ),),
          ],
        ),
      ),
    ),
  );
  }
}
