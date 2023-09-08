import 'package:flutter/material.dart';
import 'package:mom_app/core/widgets/app_bar.dart';

import '../cubit/cubit.dart';
import '../widgets/my_friends_list.dart';

class SeeAllFriends extends StatelessWidget {
  const SeeAllFriends({super.key,required this.cubit});
  final CommunityCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context,
      title: 'Friends',
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: MyFriendsList(
          lengthList : cubit.allFriends.length ,
          scrollPhysics: const BouncingScrollPhysics(),
        ),
      ) ,
    );
  }
}
