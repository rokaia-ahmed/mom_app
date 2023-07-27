import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_icon_button.dart';
import '../../../../../core/widgets/overlay_entry_card.dart';
import 'baby_tracker_deafult_screens.dart';

class Reminder extends StatelessWidget {
  const Reminder({super.key});

  @override
  Widget build(BuildContext context) {
    return babyTrackerDeafultScreens(
        context: context,
        color: AppColors.teal,
        image: false,
        title: "story time",
        icon: Icons.sports_baseball,
        description1: "2 hours ago",
        appBarText: "Reminder",
        isDated: true,
        onTap: () {
          overlayEntryCard(
              context: context,
              color: AppColors.teal,
              cardText: 'New reminder',
              text1: 'Reminder time',
              text2: 'Medication      ',
              text3: 'Note                  ')!;
        },
        description2: "animal farm");
  }
}
