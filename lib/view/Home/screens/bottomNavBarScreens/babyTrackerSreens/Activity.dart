import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_icon_button.dart';
import '../../../../../core/widgets/overlay_entry_card.dart';
import 'baby_tracker_deafult_screens.dart';
var x=5;
class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return babyTrackerDeafultScreens
      (context: context,color: Colors.orange.shade600,image: false,
        title: "story time",icon: Icons.sports_baseball,
        description1: "2 hours ago",appBarText: "Activity", isDated: true,onTap:(){
          overlayEntryCard(context: context,color:Colors.orange.shade600,
              isIcon1:customIconButton(onTap: (){}, isIcon: true,icon:Icons.date_range_outlined ),
              cardText: 'Activity', text1: 'start time', text2: 'Activity', text3: 'note')!;
        },description2: "animal farm");
  }
}