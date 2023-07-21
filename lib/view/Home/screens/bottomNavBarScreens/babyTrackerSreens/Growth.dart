import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_icon_button.dart';
import '../../../../../core/widgets/overlay_entry_card.dart';
import 'baby_tracker_deafult_screens.dart';
var x=0;
class Growth extends StatelessWidget {
  const Growth ({super.key});

  @override
  Widget build(BuildContext context) {
    return babyTrackerDeafultScreens(context: context,color: Colors.tealAccent,image: false,
        title: "story time",icon: Icons.sports_baseball,
        description1: "2 hours ago",description2: "animal farm",appBarText: "Growth", isDated: true,onTap:(){
          overlayEntryCard(context: context,color:Colors.tealAccent,
              isIcon1:customIconButton(onTap: (){}, isIcon: true,icon:Icons.date_range_outlined ),
              isIcon2:wightAndHeight(),
              isIcon3: wightAndHeight(),
              cardText: 'Growth', text1: 'Date', text2: 'Wight', text3: 'Height')!;
        });
  }
  Widget wightAndHeight(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 20,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.tealAccent,
            borderRadius: BorderRadius.circular(5)
        ),
        padding: EdgeInsets.all(2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text(" ${x}")),
            // Spacer(),
            SizedBox(width: 10,),
            Spacer(),
            Column(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      x=x+1;
                      print(x);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:BorderRadius.only(
                            topRight: Radius.circular(5)
                        ) ,
                      ),
                      child: Icon(Icons.arrow_drop_up_outlined,color: AppColors.green,size: 12),
                    ),
                  ),
                ),
                SizedBox(height: 1,),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      x=x+1;
                      print(x);
                    },
                    child: Container(

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:BorderRadius.only(
                            bottomRight: Radius.circular(5)
                        ) ,
                      ),
                      child: Icon(Icons.arrow_drop_down_outlined,color: AppColors.green,size: 12),
                    ),
                  ),
                ),
                // Expanded(child: IconButton(onPressed: (){}, icon:Icon( Icons.arrow_drop_down_outlined),iconSize: 3,))
              ],
            )
          ],
        ),
      ),
    );
  }
}