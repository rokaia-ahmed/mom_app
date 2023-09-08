import 'package:flutter/material.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import '../../../core/utils/app_colors.dart';

class BuildBabyActivity extends StatelessWidget {
  const BuildBabyActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => buildItem(index,context),
        separatorBuilder: (context, index) =>
        const SizedBox(
          width:double.infinity,
          height: 10,
        ),
        itemCount: 4);
  }
  Widget buildItem(index,BuildContext context){
    return SizedBox(
      height: context.height*0.07,
      child: Material(
        elevation:2 ,
        child: ListTile(
          title:  const Text('Smiles, laugh & coping faces',
            style: TextStyle(
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
            groupValue: index,
            onChanged: (value) {

            },
            activeColor:Colors.green ,
            autofocus:false ,
          ),
        ),
      ),
    );
  }
}
