import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/view/community/cubit/states.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/navigator.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../cubit/cubit.dart';
import '../models/my_groups.dart';
import '../screens/group_details.dart';

class MyGroupsWidget extends StatelessWidget {
  const MyGroupsWidget({super.key,
    required this.lengthList,
    required this.scrollPhysics});
  final int lengthList ;
  final ScrollPhysics scrollPhysics  ;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunityCubit, CommunityStates>(
      builder: (context, state) {
        var cubit =CommunityCubit.get(context);
        return ConditionalBuilder(
          condition:cubit.myGroupsModel !=null &&
              cubit.myGroupsModel!.groups!.isNotEmpty ,
          builder:(context)=> ListView.separated(
              shrinkWrap: true,
              physics:scrollPhysics,
              itemBuilder: (context, index) {
                return  groupItem(
                    context, cubit.myGroupsModel!.groups![index].group!);
              },
              separatorBuilder: (context, index) => Container(
                height: 16.0,
              ) ,
              itemCount:lengthList ),
          fallback: (BuildContext context){
            if(cubit.myGroupsModel!.groups!.isEmpty){
              return const Text('no groups for you',
              style:TextStyle(
                  fontSize: 20,
                 color: AppColors.primaryColor,
              ) ,
              );
            }else{
              return
                const
                Center(child: CircularProgressIndicator());
            }
          }

        );
      },
    );
  }
  Widget groupItem(BuildContext context,Group model){
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        border: Border.all(
          color: Colors.white,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 1),
            // blurRadius: 4,
            // spreadRadius: 0,
          ),
        ],
      ),
      child: InkWell(
        onTap:(){
          AppNavigator.push(context: context,
              screen:  GroupDetails(
                  isMyGroups: true,
                  id: model.id!,
              ),
          );
        } ,
        child: Row(
          children: [
            SizedBox(
              height: context.height*0.056,
              width:context.width*0.18 ,
              child:
              (model.image != null) ?
              Image.network(
                model.image!,
                fit: BoxFit.cover,):
               Image.asset('assets/images/default_group.png',
               fit:BoxFit.contain ,
               ),
            ),
            const SizedBox(width: 10.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.groupName! ,
                  style: GoogleFonts.poppins(
                      color: AppColors.green,
                      fontSize: 14.0
                  ),),
                Text('${model.count!.toString()} member',
                  style: GoogleFonts.poppins(
                    color: Colors.green,
                    fontSize: 10.0
                ),),
              ],
            ),
            const Spacer(),
            const SizedBox(width: 5.0,),
            //link icon
            customIconButton(isIcon: true,icon: Icons.link,onTap: (){}),
            const SizedBox(width: 5.0,),
            //leave icon
            customIconButton(isIcon: true,icon: Icons.exit_to_app_outlined,onTap: (){}),
          ],
        ),
      ),
    );
  }
}

