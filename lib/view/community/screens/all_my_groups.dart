import 'package:flutter/material.dart';
import 'package:mom_app/core/widgets/app_bar.dart';
import 'package:mom_app/view/community/cubit/cubit.dart';

import '../widgets/my_groups_widget.dart';

class AllMyGroups extends StatelessWidget {
  const AllMyGroups({super.key, required this.cubit});
  final CommunityCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context,
       title: 'your groups'
      ),
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: MyGroupsWidget(
            scrollPhysics:const BouncingScrollPhysics() ,
            lengthList:cubit.myGroupsModel!.groups!.length ),
      ) ,
    );
  }
}
