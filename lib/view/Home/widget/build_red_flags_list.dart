import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/core/utils/media_query_values.dart';

class BuildListFlagsList extends StatelessWidget {
  const BuildListFlagsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
      child: ListView.separated(
          shrinkWrap: true,
          physics:const NeverScrollableScrollPhysics() ,
          itemBuilder: (context ,index){
            return const BuildItem();
          },
          separatorBuilder: (context ,index)=>
          const SizedBox(height: 5),
          itemCount: 5),
    );
  }
}
class BuildItem extends StatelessWidget {
  const BuildItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height*0.05,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        minLeadingWidth:15 ,
        horizontalTitleGap:10 ,
        title: Text('Not attempting to roll by 6 months.',
          style:GoogleFonts.poppins(
          fontSize: 15,
      )  ,
        ),
        leading:const Icon(
          Icons.circle,
          size: 15,
        color: AppColors.redAcent,
        ) ,
      ),
    );
  }
}

