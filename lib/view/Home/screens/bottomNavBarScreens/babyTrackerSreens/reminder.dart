import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import 'baby_tracker_deafult_screens.dart';
class Reminder extends StatelessWidget {
  const Reminder({super.key});

  @override
  Widget build(BuildContext context) {
    return babyTrackerDeafultScreens(context: context,color: AppColors.teal,image: false,
        title: "12 PM",icon: Icons.settings_outlined,
        description: "12 hours medication reminder vitamins D",appBarText: "Reminder");
  }
}