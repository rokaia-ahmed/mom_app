import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/network/cache_helper.dart';
import 'package:mom_app/core/utils/component.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/view/community/cubit/cubit.dart';
import 'package:mom_app/view/community/cubit/states.dart';
import 'package:mom_app/view/community/screens/send_post.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/navigator.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../models/profile_details.dart';
import 'profile.dart';

class GroupDetails extends StatelessWidget {
  const GroupDetails({super.key, required this.isMyGroups, required this.id});
  final bool isMyGroups;
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommunityCubit()
        ..getGroupDetails(id: id)
        ..getProfileDetails(id: CacheHelper.getData()!.id!),
      child: BlocConsumer<CommunityCubit, CommunityStates>(
        listener: (context, state) {
          var cubit = CommunityCubit.get(context);
          if (state is LikeSuccess || state is UnLikeSuccess) {
            cubit.getGroupDetails(id: id);
          }
          else  if(cubit.isImageGroup && state is ImagePickedState){
            cubit.updateGroupImage(id: id);
          }
          else if(!cubit.isImageGroup && state is ImagePickedState){
            cubit.updateGroupCover(id: id);
          }
         else if(state is UpdateGroupCoverError ||state is UpdateGroupImageError){
            showToast(text: 'failed to upload image ',
                state: ToastStates.error);
          }
         else if(state is DeletePostSuccess){
           cubit.getGroupDetails(id: id);
          }
        },
        builder: (context, state) {
          var cubit = CommunityCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: (cubit.groupDetailsModel != null)
                  ? SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (state is UpdateGroupImageLoading ||
                              state is UpdateGroupCoverLoading)
                            const LinearProgressIndicator(),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  (cubit.groupDetailsModel!.group!.cover != null)
                                      ? Image.network(
                                          cubit
                                              .groupDetailsModel!.group!.cover!,
                                          width: double.infinity,
                                          height: context.height * 0.3,
                                          fit: BoxFit.contain,
                                          errorBuilder: (context, _, error) {
                                            return Container(
                                              width: double.infinity,
                                              height: context.height * 0.3,
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                            );
                                          },
                                        )
                                      : Container(
                                          width: double.infinity,
                                          height: context.height * 0.3,
                                          color: Colors.grey.withOpacity(0.2),
                                        ),
                                  if(cubit.groupDetailsModel!.group!.founder ==
                                    CacheHelper.getData()!.id)
                                  InkWell(
                                    onTap: () {
                                      cubit.addImage();
                                      cubit.isImageGroup =false;
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.only(right: 5),
                                      child: Icon(
                                        Icons.camera_alt,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                left: context.width * 0.1,
                                top: context.height * 0.22,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    (cubit.groupDetailsModel!.group!.image !=
                                            null)
                                        ? CircleAvatar(
                                            radius: 43,
                                            backgroundColor: Colors.transparent,
                                            backgroundImage: NetworkImage(
                                              cubit.groupDetailsModel!.group!
                                                  .image!,
                                            ),
                                          )
                                        : const CircleAvatar(
                                            radius: 43,
                                            backgroundColor: Colors.transparent,
                                            backgroundImage: AssetImage(
                                                'assets/images/default_group.png')),
                                    if(cubit.groupDetailsModel!.group!.founder ==
                                        CacheHelper.getData()!.id)
                                    InkWell(
                                      onTap: () {
                                        cubit.addImage();
                                        cubit.isImageGroup =true;
                                      },
                                      child:  Icon(
                                        Icons.camera_alt,
                                        color: Colors.white.withOpacity(0.7),
                                        size: 35,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Row(
                            children: [
                              SizedBox(
                                width: context.width * 0.1,
                              ),
                              Text(
                                cubit.groupDetailsModel!.group!.groupName!,
                                style: GoogleFonts.poppins(
                                    color: AppColors.green,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              if (!isMyGroups)
                                CustomTextButton(
                                  width: context.width * 0.3,
                                  height: context.height * 0.049,
                                  size: 16,
                                  color: Colors.white,
                                  backColor:
                                      (!cubit.groupDetailsModel!.existInGroup!)
                                          ? AppColors.primaryColor
                                          : Colors.red,
                                  onTap: () {
                                    if (!cubit
                                        .groupDetailsModel!.existInGroup!) {
                                      cubit.joinGroup(
                                          id: cubit
                                              .groupDetailsModel!.group!.id!);
                                    } else {
                                      cubit.leaveGroup(
                                          id: cubit
                                              .groupDetailsModel!.group!.id!);
                                    }
                                  },
                                  text:
                                      (!cubit.groupDetailsModel!.existInGroup!)
                                          ? 'join group'
                                          : 'leave group',
                                ),
                              const SizedBox(width: 15),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: AppColors.gray,
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: SizedBox(
                              height: 35,
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      AppNavigator.push(
                                          context: context,
                                          screen: Profile(
                                            isMyProfile: true,
                                            id: CacheHelper.getData()!.id!,
                                          ));
                                    },
                                    child: (cubit.profileDetails != null &&
                                            cubit.profileDetails!.user!.image !=
                                                null)
                                        ? CircleAvatar(
                                            backgroundColor: Colors.grey,
                                            backgroundImage: NetworkImage(cubit
                                                .profileDetails!.user!.image!),
                                            radius: 18.0,
                                          )
                                        : const CircleAvatar(
                                            backgroundImage: AssetImage(
                                                'assets/images/default_profile.png'),
                                            radius: 18.0,
                                          ),
                                  ),
                                  //search field
                                  Expanded(
                                    child: CustomTextFormField(
                                      hintText: 'Write something...',
                                      backGroundColor: Colors.grey.shade200,
                                      onTap: () {
                                        AppNavigator.push(
                                            context: context,
                                            screen: SendPost(
                                              isGroupOrFeed: true,
                                              id: id,
                                            ));
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  //search icon
                                  customIconButton(
                                      isIcon: true,
                                      icon: Icons.search_outlined,
                                      onTap: () {}),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          if(state is DeletePostLoading)
                          LinearProgressIndicator(),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: ConditionalBuilder(
                              condition:
                                  cubit.groupDetailsModel!.posts.isNotEmpty,
                              builder: (context) {
                                return ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return BuildItem(
                                      model:
                                          cubit.groupDetailsModel!.posts[index],
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      Container(
                                    height: 5.0,
                                    color: Colors.white,
                                  ),
                                  itemCount:
                                      cubit.groupDetailsModel!.posts.length,
                                );
                              },
                              fallback: (context) =>
                                  const Center(child: Text('no posts')),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}

class BuildItem extends StatelessWidget {
  const BuildItem({
    super.key,
    required this.model,
  });
  final Posts model;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<CommunityCubit, CommunityStates>(
          builder: (context, state) {
            var cubit = CommunityCubit.get(context);
            var user;
            if (cubit.profileDetails != null) {
              user = cubit.profileDetails!.user!;
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (cubit.profileDetails != null)
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            AppNavigator.push(
                                context: context,
                                screen: Profile(
                                  isMyProfile: CacheHelper.getData()!.id ==
                                      model.userId!,
                                  id: model.userId!,
                                ));
                          },
                          child: (user.image != null)
                              ? CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 20.0,
                                  backgroundImage: NetworkImage(user.image!),
                                )
                              : const CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 20.0,
                                  backgroundImage: AssetImage(
                                      'assets/images/default_profile.png'),
                                ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${user.firstName} ${user.lastName}",
                              style: GoogleFonts.poppins(
                                  color: AppColors.green,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${model.time!.substring(11, 16)} , ${model.time!.substring(0, 10)}',
                              style: GoogleFonts.poppins(
                                color: Colors.green,
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        if(model.userId ==CacheHelper.getData()!.id)
                          InkWell(
                            onTap: () {
                              cubit.deletePost(id: model.id!);
                            },
                            child: const Icon(
                              Icons.delete,
                              color: AppColors.redAcent,
                            ),
                          ),
                      ],
                    ),
                  ),
                const SizedBox(height: 10.0),
                Text(
                  model.caption!,
                  style: GoogleFonts.poppins(
                    color: AppColors.green,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10.0),
                if (model.media != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      model.media!,
                      width: double.infinity,
                      height: context.height * 0.3,
                      fit: BoxFit.cover,
                      errorBuilder: (context, _, error) {
                        return Container(
                          width: double.infinity,
                          height: context.height * 0.3,
                          color: Colors.grey.withOpacity(0.2),
                        );
                      },
                    ),
                  ),
                const SizedBox(height: 10.0),
                //comment share love icons
                Row(
                  children: [
                    (model.isLiked == true)
                        ? InkWell(
                            onTap: () {
                              cubit.postUnLike(id: model.id!);
                            },
                            child:
                                const Icon(Icons.favorite, color: Colors.red),
                          )
                        : InkWell(
                            onTap: () {
                              cubit.postLike(id: model.id!);
                            },
                            child: const Icon(
                              Icons.favorite_border_outlined,
                              color: AppColors.green,
                            ),
                          ),
                    const SizedBox(width: 10.0),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.comment_outlined,
                        color: AppColors.green,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.share_outlined,
                        color: AppColors.green,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.bookmark,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Text(
                  "${model.likeCount} Likes",
                  style: GoogleFonts.poppins(
                    color: AppColors.green,
                    fontSize: 14,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
