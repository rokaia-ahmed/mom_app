import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:intl/intl.dart';
import '../../../../../core/models/all_activity_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../../../../core/widgets/custom_icon_button.dart';
import '../../../../../core/widgets/overlay_entry_card.dart';
import '../../../../../core/widgets/top_screen_color_line.dart';
import 'healthscreens/cubit/tracker_cubit.dart';

Widget babyTrackerDefaultScreens({required BuildContext context ,required bool image,
  required color,required String appBarText,required  icon,
  required String description1,required String title,required bool isDated,
  required onTap,required GetAllActivityModel? model,description2}){
  // var cubit = TrackerCubit.get(context);
  return Scaffold(
    appBar: defaultAppBar(context: context,title: appBarText),
    backgroundColor: Colors.white,
    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        // scrollDirection: Axis.vertical,
        children: [
          //top screen color
          topScreenColorLine(color:color),
          SizedBox(
            height: context.height*0.05,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),

            child:ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder:(context, index) =>  CardList(color: color,context: context,icon: icon,title: title,isDated: isDated,image: image,index: index, model: model),
                separatorBuilder:(context, index) => Container(
              height: 20.0,
              color: Colors.white,
                  // cubit.getAllActivityModel.activities
            ), itemCount:model!.activities!.length),


          ),
          SizedBox(height: 10.0,),
          Center(
            child: InkWell(
              onTap:onTap,
              child: Icon(Icons.add_circle,size: 40.0,color: color,),
            ),
          ),
        ],
      ),
    ),
  );
}
Widget CardList({required color,required icon, required String title,required bool image,required bool isDated,required index,required GetAllActivityModel? model,required BuildContext context}){
  return Container(
    width: double.infinity,
    padding:EdgeInsets.all(10.0),
    decoration:  BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: color, // set the color of the border here
        width: 1, // set the width of the border here
      ),
    ),
    child:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 15.0,
              backgroundColor: color,
              child: Center(child: Icon(icon,size: 30.0,color: Colors.black,)),
            ),
            SizedBox(width: 10.0,),
            Text(title,style: GoogleFonts.poppins(
                color: AppColors.green,
                fontSize: 16.0,
                fontWeight: FontWeight.bold
            )),
            Spacer(),
            customIconButton(isIcon: true,icon: Icons.create_outlined,onTap: (){
              overlayEntryCard(context: context,
                  cardText:"story time",
                  text1: "Start time",
                  text2: "Activity",
                  text3: "note",
                  color: color,
                  // initialValue1:model!.activities?[index].time.toString(),
                  // initialValue2: model!.activities?[index].activity.toString(),
                  // initialValue3: model!.activities?[index].note.toString(),
                  saveOnPressed:(){

                  }
              );

            }),
          ],
        ),
        SizedBox(height: 10.0,),
        image? Image.network("https://th.bing.com/th/id/R.8e220cdb5a70a3c9376685d35509a7e0?rik=9INY0TSzHLNjOw&pid=ImgRaw&r=0",
          width: double.infinity,
          height:context.height*0.25,
          fit: BoxFit.cover,
        ): SizedBox(height: 0.0,),
        SizedBox(height: 10.0,),

        isDated?Row(
          children: [
            Text(timeAgo(model!.activities![index].date.toString(),model.activities![index].time.toString()),style: GoogleFonts.poppins(
              color: AppColors.green,
              fontSize: 12.0,
            ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(),
            Text("${model!.activities?[index].date}",style:GoogleFonts.poppins(
              color: AppColors.green,
              fontSize: 12.0,
            ) ,)
          ],
        ): Text("${model!.activities?[index].time}",style: GoogleFonts.poppins(
          color: AppColors.green,
          fontSize: 12.0,
        ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        isDated?SizedBox(height: 10.0,):SizedBox(height: 0.0,),

        isDated?Row(
          children: [
            Text("${model!.activities?[index].activity}",style: GoogleFonts.poppins(
              color: AppColors.green,
              fontSize: 12.0,
            ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(),
            Text("${model!.activities?[index].time}",style:GoogleFonts.poppins(
              color: AppColors.green,
              fontSize: 12.0,
            ) ,)
          ],
        ):SizedBox(height: 0.0,),
      ],
    ),
  );
}

String timeAgo(String date,String timeString) {
  print("time=${timeString}");
  final amOrPm=timeString.split(' ')[1];
  timeString=timeString.split(' ')[0];
  print(amOrPm);
  final datetimeString = '$date $timeString';
  // final datetime = DateTime.parse('$date ${timeString}');
  final datetime = DateFormat('yyyy-MM-dd HH:mm').parse(datetimeString);
  final now = DateTime.now();
  print(now.hour.toString());
  final isAm = now.hour < 12;
  var difference=now.difference(datetime);
  if(!isAm&&amOrPm=='pm') difference-=Duration(hours: 12);
  if (difference.inDays > 0) {
    // more than 24 hours ago
    return DateFormat('MMM d').format(datetime).toString();
    // return "hello";
  } else if (difference.inHours > 0) {
    // more than an hour ago
    return '${difference.inHours.toString()} hour${difference.inHours == 1 ? '' : 's'} ago';
  } else if (difference.inMinutes > 0) {
    // less than an hour ago
    return '${difference.inMinutes.toString()} minute${difference.inMinutes == 1 ? '' : 's'} ago';
  } else {
    // less than a minute ago
    return 'just now';
  }
}





class TrackingScreens{
   BuildContext? context;
  final bool image;
  final Color color;
  final String appBarText;
  final IconData icon;
  final String description1;
  final String title;
  final bool isDated;
  final VoidCallback onTap;
  final dynamic model;
  final String description2;

  TrackingScreens({
    required BuildContext context,
    required this.image,
    required this.color,
    required this.appBarText,
    required this.icon,
    required this.description1,
    required this.title,
    required this.isDated,
    required this.onTap,
    required this.model,
    required this.description2,
  });
  Widget babyTrackerDefaultScreens(){
    return Scaffold(
      appBar: defaultAppBar(context:context!,title: appBarText),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          // scrollDirection: Axis.vertical,
          children: [
            //top screen color
            topScreenColorLine(color:color),
            SizedBox(
              height: context!.height*0.05,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),

              child:ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder:(context, index) => cardList(), separatorBuilder:(context, index) => Container(
                height: 20.0,
                color: Colors.white,
              ), itemCount: 7),

            ),
            SizedBox(height: 10.0,),
            Center(
              child: InkWell(
                onTap:onTap,
                child: Icon(Icons.add_circle,size: 40.0,color: color,),
              ),
            ),
            SizedBox(height: 30.0,),
          ],
        ),
      ),
    );
  }
   Widget cardList(){
     return Container(
       width: double.infinity,
       padding:EdgeInsets.all(10.0),
       decoration:  BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.circular(10.0),
         border: Border.all(
           color: color, // set the color of the border here
           width: 1, // set the width of the border here
         ),
       ),
       child:  Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Row(
             children: [
               CircleAvatar(
                 radius: 15.0,
                 backgroundColor: color,
                 child: Center(child: Icon(icon,size: 30.0,color: Colors.black,)),
               ),
               SizedBox(width: 10.0,),
               Text(title,style: GoogleFonts.poppins(
                   color: AppColors.green,
                   fontSize: 16.0,
                   fontWeight: FontWeight.bold
               )),
               Spacer(),
               customIconButton(isIcon: true,icon: Icons.create_outlined,onTap: (){}),
             ],
           ),
           SizedBox(height: 10.0,),
           image? Image.network("https://th.bing.com/th/id/R.8e220cdb5a70a3c9376685d35509a7e0?rik=9INY0TSzHLNjOw&pid=ImgRaw&r=0",
             width: double.infinity,
             height:context!.height*0.25,
             fit: BoxFit.cover,
           ): SizedBox(height: 0.0,),
           SizedBox(height: 10.0,),

           isDated?Row(
             children: [
               Text(description1,style: GoogleFonts.poppins(
                 color: AppColors.green,
                 fontSize: 12.0,
               ),
                 maxLines: 2,
                 overflow: TextOverflow.ellipsis,
               ),
               Spacer(),
               Text("18/6/2023",style:GoogleFonts.poppins(
                 color: AppColors.green,
                 fontSize: 12.0,
               ) ,)
             ],
           ): Text(description1,style: GoogleFonts.poppins(
             color: AppColors.green,
             fontSize: 12.0,
           ),
             maxLines: 2,
             overflow: TextOverflow.ellipsis,
           ),
           isDated?SizedBox(height: 10.0,):SizedBox(height: 0.0,),

           isDated?Row(
             children: [
               Text(description2,style: GoogleFonts.poppins(
                 color: AppColors.green,
                 fontSize: 12.0,
               ),
                 maxLines: 2,
                 overflow: TextOverflow.ellipsis,
               ),
               Spacer(),
               Text("12:35 pm",style:GoogleFonts.poppins(
                 color: AppColors.green,
                 fontSize: 12.0,
               ) ,)
             ],
           ):SizedBox(height: 0.0,),
         ],
       ),
     );
   }
}


