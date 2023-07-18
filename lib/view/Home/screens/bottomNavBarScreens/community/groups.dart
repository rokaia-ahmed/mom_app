
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../../core/widgets/custom_icon_button.dart';
import '../../chats.dart';


Widget groups({required BuildContext context}){
  return Padding(
    padding:  const EdgeInsets.all(20.0),
    child: Column(
      children: [
        Row(
          children: [
            Text("All Groups",style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: AppColors.green,
              fontSize: 16,
            ),),
            Spacer(),
            //search icon
            customIconButton(isIcon: true,icon: Icons.search_outlined,onTap: (){}),
            SizedBox(width: 5.0,),
            //message icon
            customIconButton(isIcon: true,icon: Icons.message_outlined,onTap: (){
              AppNavigator.push(context: context, screen: Chats());
            }),
          ],
        ),
        SizedBox(height: 20.0,),
        Row(
          children: [
            Text("Your Groups",style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: AppColors.green,
              fontSize: 16
            ),),
            Spacer(),
            customIconButton(isIcon: false,text: "see all",fontSize: 12.0,color: Colors.green,onTap: (){}),
          ],
        ),
        SizedBox(height: 20.0,),
        //you groups list
        groupList(),
        //recommended line
        Row(
          children: [
            Text("Recommended for you",style: GoogleFonts.poppins(
              color: AppColors.green,
              fontSize: 16.0,
            ),),
            Spacer(),
            customIconButton(isIcon: false,text: "see all",fontSize: 12.0,color: Colors.green,onTap: (){}),
          ],
        ),
        SizedBox(height: 20.0,),
        //grid view
        SizedBox(

          child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.05,
              crossAxisCount: 2,children:List.generate(5, (index) => buildGridView()
          )
          ),
        )
        //group style

  ]
  )
  );
}
Widget buildGridView(){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.greenAccent.shade200,
    ),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Image(
            width: double.infinity,
            image: NetworkImage('https://th.bing.com/th/id/OIP.2_wYPt9NQjmLngMPv9WXuQHaE8?w=270&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
            // width: double.infinity,
            // height: 100.0,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0,right: 5.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Parent in vacation",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.poppins(
                        color: AppColors.green,
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    Text("550 members",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.poppins(
                        color: AppColors.green,
                        fontSize: 10.0,
                      ),
                    ),
                  ],
                ),
              ),
              customIconButton(onTap: (){}, isIcon:true,icon:Icons.add_circle_sharp,color: Colors.white ),

            ],
          ),
        ),

      ],
    ),
  );

}
Widget groupList(){
  return ListView.separated(
    shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) =>
          Container(
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
                    Text("Healthy Recipies" ,style: GoogleFonts.poppins(
                        color: AppColors.green,
                        fontSize: 14.0
                    ),),
                    Text("500 members",style: GoogleFonts.poppins(
                        color: Colors.green,
                        fontSize: 10.0
                    ),),
                  ],
                ),
                Spacer(),
                SizedBox(width: 5.0,),
                //link icon
                customIconButton(isIcon: true,icon: Icons.link,onTap: (){}),
                SizedBox(width: 5.0,),
                //leave icon
                customIconButton(isIcon: true,icon: Icons.exit_to_app_outlined,onTap: (){}),
              ],
            ),
          ), separatorBuilder: (context, index) => Container(
    height: 16.0,
  ) , itemCount: 4);
}
