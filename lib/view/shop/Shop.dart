
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';


class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Shop Screen",style: TextStyle(
          color: AppColors.green,
        ),),
      ),
    );
  }
}
