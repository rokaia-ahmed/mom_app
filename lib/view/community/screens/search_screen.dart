import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/widgets/app_bar.dart';
import 'package:mom_app/core/widgets/custom_text_form_field.dart';
import 'package:mom_app/view/community/cubit/cubit.dart';
import 'package:mom_app/view/community/cubit/states.dart';
import 'package:mom_app/view/community/screens/profile.dart';

import '../../../core/network/cache_helper.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/navigator.dart';
import '../models/all_posts.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommunityCubit, CommunityStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit =   CommunityCubit.get(context);
        return Scaffold(
          appBar: defaultAppBar(context: context,
            title: 'Search',
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(),
                  ),
                  child: CustomTextFormField(
                    onSubmitted:(val){
                      cubit.searchInPosts(searchController.text);
                    },
                    OnChange: (value){
                      cubit.searchInPosts(value);
                    },
                    controller: searchController,
                    hintText: 'search....',
                    backGroundColor: Colors.white,
                    preIcon: Icon(Icons.search,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                ConditionalBuilder(
                    condition: cubit.searchPosts.isNotEmpty,
                    builder: (context) {
                      return Expanded(
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) =>
                                PostCard(post: cubit.searchPosts[index],),
                            separatorBuilder: (context, index) =>
                                Container(
                                  height: 2.0,
                                  color: Colors.white,
                                ),
                            itemCount: cubit.searchPosts.length),
                      );
                    },
                    fallback: (context) {
                        return const SizedBox();
                    }
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
class PostCard extends StatelessWidget {
  const PostCard({super.key,
    this.post});
  final AllPostsModel?  post ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommunityCubit, CommunityStates>(
      listener: (context, state) {},
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
                      InkWell(
                        onTap:(){
                          AppNavigator.push(
                            context: context,
                            screen:  Profile(
                              isMyProfile: (CacheHelper.getData()!.id == post!.userId),
                              id:post!.userId! ,
                            ),

                          );
                        } ,
                        child: (post!.users!.image != null)?
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                          NetworkImage(post!.users!.image!) ,
                          radius: 20.0,):
                        const CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                          AssetImage('assets/images/default_profile.png') ,
                          radius: 20.0,
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
                            '${post!.users!.firstName} ${post!.users!.lastName}',
                            style: GoogleFonts.poppins(
                                color: AppColors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text( '${post!.time!.substring(11,16)} , ${post!.time!.substring(0,10)}' ,
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
                Text(post!.caption!,
                  style: GoogleFonts.poppins(
                    color: AppColors.green,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10.0),
                if(post!.media != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      post!.media! ,
                      errorBuilder: (context,url,error){
                        return Container(
                          color:AppColors.gray.withOpacity(0.2),
                          width:double.infinity ,
                          height: context.height*0.3,
                        );
                      },
                      width:double.infinity ,
                      height: context.height*0.3,
                      fit: BoxFit.cover,
                    ),
                  ),
                const SizedBox(height: 10.0),
                //comment share love icons
                Row(
                  children: [
                    (post!.isLiked == true)?
                    InkWell(
                      onTap:(){
                        cubit.postUnLike(id: post!.id!);
                      } ,
                      child:  const Icon(
                          Icons.favorite,
                          color: Colors.red
                      ),
                    ):
                    InkWell(
                      onTap:(){
                        cubit.postLike(id: post!.id!);
                      } ,
                      child:  const Icon(
                        Icons.favorite_border_outlined,
                        color: AppColors.green,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    InkWell(
                      onTap:(){} ,
                      child: const Icon(
                        Icons.comment_outlined,
                        color: AppColors.green,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    InkWell(
                      onTap:(){} ,
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
                  post!.likeCount!.toString() ,
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