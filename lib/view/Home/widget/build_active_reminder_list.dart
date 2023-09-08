import 'package:flutter/material.dart';
import 'package:mom_app/core/utils/media_query_values.dart';

import '../../../../../core/utils/app_colors.dart';

class BuildActiveReminderList extends StatefulWidget {
     const BuildActiveReminderList({super.key,});

  @override
  State<BuildActiveReminderList> createState() => _BuildActiveReminderListState();
}

class _BuildActiveReminderListState extends State<BuildActiveReminderList> {
    int  currentIndex =0;
    bool isTaped =false ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.18,
      child: ListView.separated(
          itemBuilder: (context, index) => buildItem(index),
          separatorBuilder: (context, index) => const
           Divider(
            height: 5,
            indent: 10,
            endIndent: 10,
          ),
          itemCount: 3),
    );
  }

  Widget buildItem(index){
    return ListTile(
      title:  Text('Your baby’s vitamins',
        style: TextStyle(
          decoration:(currentIndex==index)?
          TextDecoration.lineThrough :
          TextDecoration.none,
        ),
      ),
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: -15,
      leading:Container(
        color: AppColors.lightGreen,
        width: 10,
        height: double.infinity,
      ),
      trailing: Radio(
        value: index,
        groupValue: currentIndex,
        onChanged: (value) {
          setState(() {
            currentIndex = value!;
            isTaped = true ;
            print(value);
          });
        },

        activeColor:Colors.green ,
        autofocus:false ,
      ),
    );
  }
}
