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
import '../models/request_friend.dart';
import '../screens/profile.dart';

class FriendRequestWidget extends StatelessWidget {
  const FriendRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommunityCubit, CommunityStates>(
            listener: (context, state) {
             /* var cubit = CommunityCubit.get(context);
              if (state is AcceptRequestSuccess
                  ||state is RejectRequestSuccess){
                   cubit.getAllFriendsRequests();
              }*/
            },
            builder: (context, state) {
              var cubit = CommunityCubit.get(context);
              return ConditionalBuilder(
                condition: cubit.allFriendsRequests.isNotEmpty,
                builder: (context) {
                  return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => FriendsRequestList(
                          model: cubit.allFriendsRequests[index],
                      ),
                      separatorBuilder: (context, index) => Container(
                            height: 16.0,
                          ),
                      itemCount: cubit.allFriendsRequests.length);
                },
                fallback: (context) {
                  if (state is GetAllFriendsRequestsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if(cubit.allFriendsRequests.isEmpty){
                    return const Text(
                      'no friends request',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.primaryColor,
                      ),
                    );
                  }
                  return const SizedBox();
                },
              );
            },
          );
  }
}

class FriendsRequestList extends StatelessWidget {
  const FriendsRequestList({super.key,
    required this.model});
  final RequestFriendModel model;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => CommunityCubit()
    ..getProfileDetails(id: model.user1Id)..getAllFriendsRequests(),
  child: BlocConsumer<CommunityCubit, CommunityStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var cubit = CommunityCubit.get(context);
        if (cubit.profileDetails ==null) {
          return const Center(child: CircularProgressIndicator());
        } else {
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
              child: Column(
                children: [
              if (state is AcceptRequestLoading
              ||state is RejectRequestLoading)
                 const LinearProgressIndicator(),
                  Row(
                    children: [
                      //image
                      InkWell(
                        onTap: () {
                          AppNavigator.push(
                            context: context,
                            screen: Profile(
                                isMyProfile:
                                    CacheHelper.getData()!.id == model.id!,
                                id: model.user1Id!,
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 18.0,
                          backgroundColor: Colors.transparent,
                          child: (cubit.profileDetails!.user!.image != null)
                              ? Image.network(
                                cubit.profileDetails!.user!.image!,
                                  errorBuilder: (context, _, error) {
                                    return Image.asset(
                                        'assets/images/default_profile.png');
                                  },
                                )
                              : Image.asset('assets/images/default_profile.png'),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "${cubit.profileDetails!.user!.firstName} "
                          "${cubit.profileDetails!.user!.lastName}",
                        style: GoogleFonts.poppins(
                          color: AppColors.green,
                          fontSize: 16.0,
                        ),
                      ),
                      const Spacer(),
                      //accept friend request
                      customIconButton(
                          isIcon: true,
                          icon: Icons.check_circle_outline,
                          color: AppColors.primaryColor,
                          onTap: () {
                            cubit.acceptFriend(id:model.id!);
                          }),
                      const SizedBox(
                        width: 10.0,
                      ),
                      //reject friend request
                      customIconButton(
                          isIcon: true,
                          icon: Icons.highlight_remove,
                          color: AppColors.primaryColor,
                          onTap: () {
                            cubit.rejectFriend(id:model.id!);
                          }),
                      const SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      },
    ),
);
  }
}
