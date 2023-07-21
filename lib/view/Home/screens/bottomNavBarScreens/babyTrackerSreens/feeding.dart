import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_icon_button.dart';
import '../../../../../core/widgets/overlay_entry_card.dart';
import 'baby_tracker_deafult_screens.dart';
class Feeding extends StatelessWidget {
  const Feeding({super.key});

  @override
  Widget build(BuildContext context) {
    return babyTrackerDeafultScreens
      (context: context,color: Colors.yellowAccent,image: true,
        title: "last feed",icon: Icons.emoji_food_beverage_outlined,
        description1: "2 hours ago",appBarText: "Feeding", isDated: true,onTap:(){
          overlayEntryCard(context: context,color:Colors.yellowAccent,
              isIcon1:customIconButton(onTap: (){}, isIcon: true,icon:Icons.date_range_outlined ),
              cardText: 'Last feeding', text1: 'start time', text2: 'Food', text3: 'Note')!;
        },description2: "Apple and potato");

  }
}