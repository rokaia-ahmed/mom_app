import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mom_app/core/utils/media_query_values.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/widgets/app_bar.dart';
import '../../../../../../core/widgets/top_screen_color_line.dart';

class Doctors extends StatelessWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: defaultAppBar(context: context,title: "Doctors"),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              // scrollDirection: Axis.vertical,
                children: [
                  SizedBox(
                    height: context.height*0.02,
                  ),
                  //top screen color
                  topScreenColorLine(color: AppColors.lightGreen),
                  SizedBox(
                    height: context.height*0.005,
                  ),

                ])));
  }
}
