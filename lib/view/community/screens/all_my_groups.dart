import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_app/core/widgets/app_bar.dart';
import 'package:mom_app/view/community/cubit/cubit.dart';
import 'package:mom_app/view/community/cubit/states.dart';

import '../widgets/my_groups_widget.dart';

class AllMyGroups extends StatelessWidget {
  const AllMyGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommunityCubit()..getMyGroups(),
      child: BlocConsumer<CommunityCubit, CommunityStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = CommunityCubit.get(context);
          return Scaffold(
            appBar: defaultAppBar(context: context,
                title: 'your groups'
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child:
                (cubit.myGroupsModel !=null) ?
                 MyGroupsWidget(
                  scrollPhysics: const BouncingScrollPhysics(),
                  lengthList: cubit.myGroupsModel!.groups!.length):
                 Center(child: CircularProgressIndicator()) ,
            ),
          );
        },
      ),
    );
  }
}
