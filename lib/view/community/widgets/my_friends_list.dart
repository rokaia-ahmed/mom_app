import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/view/community/cubit/cubit.dart';
import 'package:mom_app/view/community/cubit/states.dart';

import '../../../core/network/cache_helper.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/navigator.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../models/all_posts.dart';
import '../screens/profile.dart';

class MyFriendsList extends StatelessWidget {
  const MyFriendsList({super.key,
    required this.lengthList, required this.scrollPhysics});
   final  int lengthList ;
  final ScrollPhysics scrollPhysics  ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommunityCubit, CommunityStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CommunityCubit.get(context);
        return ConditionalBuilder(
            condition: cubit.allFriends.isNotEmpty,
            builder: (context) {
              return ListView.separated(
                shrinkWrap: true,
                physics: scrollPhysics,
                itemBuilder: (context, index) =>
                    friendsList(cubit.allFriends[index], context),
                separatorBuilder: (context, index) =>
                    Container(
                      height: 16.0,
                    ),
                itemCount: lengthList,
              );
            },
            fallback: (context) {
              if (cubit.allFriends.isEmpty) {
                return const Text(
                  'add friends to your list ',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.primaryColor,
                  ),
                );
              } else {
                return
                  const
                  Center(child: CircularProgressIndicator());
              }
            }
        );
      },
    );
  }
}

Widget friendsList(Users model, context) {
  return Container(
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
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              AppNavigator.push(context: context,
                screen: Profile(
                    isMyProfile: CacheHelper.getData()!.id == model.id!,
                    id: model.id!),
              );
            },
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 18.0,
              child: (model.image != null) ?
              Image.network(model.image!,
                errorBuilder: (context, _, error) {
                  return Image.asset('assets/images/default_profile.png');
                },
              ) :
              Image.asset('assets/images/default_profile.png'),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            "${model.firstName} ${model.lastName}",
            style: GoogleFonts.poppins(
              color: AppColors.green,
              fontSize: 16.0,
            ),
          ),
          const Spacer(),
          customIconButton(
              isIcon: true,
              icon: Icons.message_rounded,
              color: AppColors.primaryColor,
              onTap: () {}),
        ],
      ),
    ),
  );
}