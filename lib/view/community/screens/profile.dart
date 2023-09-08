import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/network/cache_helper.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/view/community/cubit/cubit.dart';
import 'package:mom_app/view/community/cubit/states.dart';
import 'package:mom_app/view/community/models/all_posts.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/component.dart';
import '../../../core/widgets/custom_button.dart';
import '../models/profile_details.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.isMyProfile, required this.id});
  final bool isMyProfile;
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommunityCubit()
        ..getProfileDetails(id: id),
      child: BlocConsumer<CommunityCubit, CommunityStates>(
        listener: (context, state) {
          var cubit = CommunityCubit.get(context);
         /* if (state is GetProfileSuccess) {
            print(cubit.profileDetails!.user!.firstName);
          }*/
          if (state is LikeSuccess || state is UnLikeSuccess) {
            cubit.getProfileDetails(id: id);
          }
          if (cubit.isImageProfile && state is ImagePickedState) {
            cubit.updateProfileImage();
          }
          if(!cubit.isImageProfile && state is ImagePickedState) {
            cubit.updateProfileCover();
          }
          if(state is UpdateProfileImageError ||
              state is UpdateProfileCoverError){
            showToast(text: 'failed to upload image ',
                state: ToastStates.error);
          }
        },
        builder: (context, state) {
          var cubit = CommunityCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: (cubit.profileDetails != null)
                  ? SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (state is UpdateProfileImageLoading ||
                              state is UpdateProfileCoverLoading)
                            const LinearProgressIndicator(),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  (cubit.profileDetails!.user!.cover != null &&
                                          cubit.profileDetails!.user!.cover!
                                              .isNotEmpty)
                                      ? Image.network(
                                          cubit.profileDetails!.user!.cover!,
                                          width: double.infinity,
                                          height: context.height * 0.3,
                                          fit: BoxFit.cover,
                                        )
                                      : Container(
                                          color: Colors.grey.withOpacity(0.2),
                                          width: double.infinity,
                                          height: context.height * 0.3,
                                        ),
                                  if (cubit.profileDetails!.user!.id ==
                                      CacheHelper.getData()!.id)
                                    InkWell(
                                      onTap: () {
                                        cubit.addImage();
                                        cubit.isImageProfile =false;
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: Icon(
                                          Icons.camera_alt,
                                          size: 35,
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
                                      (cubit.profileDetails!.user!.image !=
                                              null)
                                          ? CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              backgroundImage: NetworkImage(
                                                  cubit.profileDetails!.user!
                                                      .image!),
                                              radius: 43.0,
                                            )
                                          : const CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              backgroundImage: AssetImage(
                                                  'assets/images/default_profile.png'),
                                              radius: 43.0,
                                            ),
                                      if (cubit.profileDetails!.user!.id ==
                                          CacheHelper.getData()!.id)
                                        GestureDetector(
                                          onTap: () {
                                            cubit.addImage();
                                            cubit.isImageProfile = true;
                                          },
                                          child:  Icon(
                                            Icons.camera_alt,
                                            color: Colors.white.withOpacity(0.8),
                                            size: 35,
                                          ),
                                        ),
                                    ],
                                  )),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Row(
                            children: [
                              SizedBox(
                                width: context.width * 0.1,
                              ),
                              SizedBox(
                                width: context.width * 0.45,
                                child: Text(
                                  '${cubit.profileDetails!.user!.firstName!} ${cubit.profileDetails!.user!.lastName!}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      color: AppColors.green,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Spacer(),
                              if (!isMyProfile)
                                InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.chat_outlined,
                                  ),
                                ),
                              const SizedBox(width: 10),
                              if (!isMyProfile)
                                CustomTextButton(
                                  width: context.width * 0.3,
                                  height: context.height * 0.049,
                                  size: 16,
                                  color: Colors.black,
                                  backColor:
                                      (cubit.profileDetails!.existInFriend!)
                                          ? Colors.red
                                          : AppColors.primaryColor,
                                  onTap: () {
                                    if (!cubit.profileDetails!.existInFriend!) {
                                      cubit.addFriend(
                                          id: cubit.profileDetails!.user!.id!);
                                    } else {
                                      cubit.unFriend(
                                          id: cubit.profileDetails!.user!.id!);
                                    }
                                  },
                                  text: (cubit.profileDetails!.existInFriend!)
                                      ? 'Unfriend'
                                      : 'Add friend',
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
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: ConditionalBuilder(
                                condition:
                                    cubit.profileDetails!.posts.isNotEmpty,
                                builder: (context) {
                                  return ListView.separated(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) =>
                                          BuildItem(
                                            model: cubit
                                                .profileDetails!.posts[index],
                                            user: cubit.profileDetails!.user!,
                                          ),
                                      separatorBuilder: (context, index) =>
                                          Container(
                                            height: 2.0,
                                            color: Colors.white,
                                          ),
                                      itemCount:
                                          cubit.profileDetails!.posts.length);
                                },
                                fallback: (context) {
                                  if (state is GetProfileLoading) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else {
                                    return const Text('no posts ');
                                  }
                                }),
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
    required this.user,
  });
  final Posts model;
  final Users user;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunityCubit, CommunityStates>(
      builder: (context, state) {
        var cubit = CommunityCubit.get(context);
        return Card(
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      (user.image != null)
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
                      const SizedBox(
                        width: 5.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${user.firstName} ${user.lastName}",
                            maxLines: 2,
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
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.more_vert_outlined,
                          color: AppColors.green,
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
                      errorBuilder: (context, _, error) {
                        return Container(
                          width: double.infinity,
                          height: context.height * 0.3,
                          color: Colors.grey.withOpacity(0.2),
                        );
                      },
                      width: double.infinity,
                      height: context.height * 0.3,
                      fit: BoxFit.cover,
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
                  model.likeCount.toString(),
                  style: GoogleFonts.poppins(
                    color: AppColors.green,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
