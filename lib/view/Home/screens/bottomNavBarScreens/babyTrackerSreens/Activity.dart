import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'baby_tracker_deafult_screens.dart';
class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return babyTrackerDeafultScreens(context: context,color: Colors.orange.shade600,image: true,
        title: "12 PM",icon: Icons.settings_outlined,
        description: "12 hours medication reminder vitamins D",appBarText: "Activity");
  }
}