import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_app/core/network/cache_helper.dart';
import 'package:mom_app/core/utils/navigator.dart';
import 'package:mom_app/view/chat/chats.dart';
import 'package:mom_app/view/community/cubit/cubit.dart';
import 'package:mom_app/view/community/cubit/states.dart';
import 'package:mom_app/view/community/screens/search_screen.dart';
import 'package:mom_app/view/community/screens/send_post.dart';
import '../../../../../../core/widgets/custom_icon_button.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../widgets/build_posts.dart';
import 'profile.dart';

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommunityCubit()..getAllPosts()
        ..getProfileDetails(id: CacheHelper.getData()!.id),
      child: BlocConsumer<CommunityCubit, CommunityStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = CommunityCubit.get(context);
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: Row(
                    children: [
                      //profile image
                      InkWell(
                        onTap: () {
                          AppNavigator.push(context: context,
                              screen: Profile(isMyProfile: true,
                                id: CacheHelper.getData()!.id!,
                              ));
                        },
                        child: (cubit.profileDetails != null &&
                            cubit.profileDetails!.user!.image != null) ?
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(
                              cubit.profileDetails!.user!.image!),
                          radius: 18.0,
                        ) : const CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/images/default_profile.png'),
                          radius: 18.0,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      //search field
                      Expanded(
                        child: CustomTextFormField(
                          hintText: 'Write something...',
                          backGroundColor: Colors.grey.shade200,
                          onTap: () {
                            AppNavigator.push(
                                context: context, screen: SendPost(
                              isGroupOrFeed: false,
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
                          onTap: () {
                            AppNavigator.push(context: context,
                                screen: SearchScreen());
                          }
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      //message icon
                      customIconButton(
                          isIcon: true, icon: Icons.chat_outlined,
                          onTap: () {
                            AppNavigator.push(context: context,
                                screen: const Chats());
                          }),
                    ],
                  ),
                ),
              ),
              //posts style
              const BuildPosts(),
            ],
          );
        },
      ),
    );
  }
}


