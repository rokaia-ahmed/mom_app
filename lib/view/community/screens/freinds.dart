import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/navigator.dart';
import 'package:mom_app/view/community/cubit/cubit.dart';
import 'package:mom_app/view/community/cubit/states.dart';
import 'package:mom_app/view/community/screens/see_all_friends.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/widgets/custom_icon_button.dart';
import '../../chat/chats.dart';
import '../widgets/friend_requests_widget.dart';
import '../widgets/my_friends_list.dart';

class Friends extends StatelessWidget {
  const Friends({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommunityCubit()..getAllFriends()..getAllFriendsRequests(),
      child: BlocConsumer<CommunityCubit, CommunityStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = CommunityCubit.get(context);
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      "All Friends",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: AppColors.green,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    customIconButton(
                        isIcon: true,
                        icon: Icons.search_outlined,
                        onTap: () {}),
                    const SizedBox(
                      width: 5.0,
                    ),
                    customIconButton(
                        isIcon: true,
                        icon: Icons.message_outlined,
                        onTap: () {
                          AppNavigator.push(
                              context: context, screen: const Chats());
                        }),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Text(
                      "${cubit.allFriends.length} Friends",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: AppColors.green,
                          fontSize: 16),
                    ),
                    const Spacer(),
                    customIconButton(
                        isIcon: false,
                        text: "see all",
                        fontSize: 12.0,
                        color: AppColors.primaryColor,
                        onTap: () {
                          AppNavigator.push(context: context,
                              screen:
                              SeeAllFriends(cubit: cubit,)
                          );
                        }),
                    // SizedBox(width: 10.0,),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                //you freinds list
                MyFriendsList(
                  lengthList: (cubit.allFriends.length > 3) ? 3 :
                  cubit.allFriends.length,
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                //friends requist
                Row(
                  children: [
                    Text(
                      "Friends Requests",
                      style: GoogleFonts.poppins(
                          color: AppColors.green,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    customIconButton(
                        isIcon: false,
                        text: "see all",
                        fontSize: 12.0,
                        color: AppColors.primaryColor,
                        onTap: () {}),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const FriendRequestWidget(),
              ]
              ),
            ),
          );
        },
      ),
    );
  }
}



