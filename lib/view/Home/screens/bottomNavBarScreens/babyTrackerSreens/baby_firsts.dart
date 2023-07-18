import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import 'baby_tracker_deafult_screens.dart';
class BabyFirsts extends StatelessWidget {
  const BabyFirsts({super.key});

  @override
  Widget build(BuildContext context) {
    return babyTrackerDeafultScreens(context: context,color: AppColors.redAcent,image: true,
        title: "12 PM",icon: Icons.settings_outlined,
        description: "12 hours medication reminder vitamins D",appBarText: "Baby firsts");
  }
}