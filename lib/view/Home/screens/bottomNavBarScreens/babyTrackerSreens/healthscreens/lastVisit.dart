import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mom_app/core/utils/media_query_values.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/widgets/custom_icon_button.dart';
import '../../../../../../core/widgets/overlay_entry_card.dart';

class LastVisit extends StatelessWidget {
  const LastVisit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder:(context, index) =>  lastVisitCard(context), separatorBuilder:(context, index) => Container(
          height: 2.0,
          color: Colors.white,
        ), itemCount: 2),
        SizedBox(height: 20.0),
        Center(
          child: InkWell(
            onTap:(){
              overlayEntryCard(context: context,color:AppColors.lightGreen,
                  isIcon1:customIconButton(onTap: (){}, isIcon: true,icon:Icons.date_range_outlined ),
                  cardText: 'Last visit', text1: 'Date', text2: 'Dr.Name', text3: 'Diagnosis');
            },
            child: Icon(Icons.add_circle,size: 40.0,color:AppColors.lightGreen),
          ),
        ),
      ],
    );
  }
  Widget lastVisitCard(BuildContext context){
    return TextButton(
      onPressed: () {
        // AppNavigator.push(context: context,
        //   screen:  screen,
        // );
      },
      child:DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(

            color: Colors.white,
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              // spreadRadius: 2,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Container(
          width:context.width,
          height: context.height*.15,
          // padding: EdgeInsets.all(20.0),
          // color: Colors.green,
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //colored part
              DecoratedBox(
                decoration: BoxDecoration(
                    color: AppColors.lightGreen,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                    )

                ),
                child: Container(
                  width:context.width*.05,
                  // color: Colors.green,
                ),
              ),
              SizedBox(
                width: context.width*0.02,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10,top: 20,bottom: 20),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Dr.Name: Ahmed Ali",style: TextStyle(
                          color: AppColors.green
                      )),
                      Spacer(),
                      Text("Diagnosis: Flu",style: TextStyle(
                          color: Colors.green,
                          fontSize: 12.0
                      )),
                    ],
                  ),
                ),
              ),
              // SizedBox(width: 5.0,),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 20,bottom: 20,right: 10),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Age: 6 months",style: TextStyle(
                          color: Colors.green,
                          fontSize: 12.0
                      ),),
                      Spacer(),
                      Text("Due date:31/12/2023",style: TextStyle(
                          color: AppColors.green,
                          fontSize: 12.0
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ) ,
    );
  }
}
