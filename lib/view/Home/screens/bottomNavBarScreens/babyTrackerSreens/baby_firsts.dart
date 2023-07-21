import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_icon_button.dart';
import '../../../../../core/widgets/overlay_entry_card.dart';
import 'baby_tracker_deafult_screens.dart';
class BabyFirsts extends StatelessWidget {
  const BabyFirsts({super.key});

  @override
  Widget build(BuildContext context) {
    return babyTrackerDeafultScreens(context: context,color: AppColors.redAcent,image: true,
        title: "12 PM",icon: Icons.settings_outlined,
        description1: "12 hours medication reminder vitamins D",appBarText: "Baby firsts",isDated: false,onTap:(){
          overlayEntryCard(context: context,color:AppColors.redAcent,
              isIcon1:customIconButton(onTap: (){}, isIcon: true,icon:Icons.date_range_outlined ),
              cardText: 'Baby first', text1: 'Date', text2: 'Baby first', text3: 'Note')!;
        });
  }
}