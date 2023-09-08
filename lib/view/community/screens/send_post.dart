import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/utils/navigator.dart';
import 'package:mom_app/core/widgets/custom_button.dart';
import 'package:mom_app/core/widgets/custom_text_form_field.dart';
import 'package:mom_app/view/community/cubit/cubit.dart';
import 'package:mom_app/view/community/cubit/states.dart';
import '../../../core/utils/component.dart';
import '../../../core/widgets/app_bar.dart';
import 'community.dart';

class SendPost extends StatelessWidget {
  SendPost({super.key, required this.isGroupOrFeed,
    this.id});
  final postController = TextEditingController();
  final bool isGroupOrFeed;
  final String? id ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommunityCubit, CommunityStates>(
      listener: (context, state) {
        if(state is SendPublicPostSuccess ||
            state is SendGroupPostSuccess){
          var cubit = CommunityCubit.get(context);
          showToast(text: 'post send successfully',
          state: ToastStates.success,
          );
          AppNavigator.push(context: context,
              screen: const Community());
            cubit.image = null ;
        }
        if(state is SendPublicPostError || state is SendGroupPostError) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        var cubit = CommunityCubit.get(context);
        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: "write post",
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                if(state is SendPublicPostLoading ||
                    state is SendGroupPostLoading )
                  const Column(
                    children: [
                      LinearProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: AppColors.primaryColor),
                  ),
                  child: CustomTextFormField(
                    hintText: 'write something....',
                    backGroundColor: Colors.white,
                    maxLines: 5,
                    controller: postController,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    (cubit.image !=null)?
                    ShowImage(image:cubit.imageShow!) :
                    Expanded(
                      child: BuildContainer(
                        icon: Icons.image,
                        color: AppColors.gray.withOpacity(0.1),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    BuildContainer(
                      icon: Icons.camera_alt,
                      width: 50 ,
                      onTap: (){
                        cubit.addImage();
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextButton(
                  onTap: () {
                    if(isGroupOrFeed==true){
                      if(postController.text.isNotEmpty){
                        cubit.sendGroupPost(
                          text:postController.text,
                          id: id,
                        );
                      }
                    }
                    else{
                      if(postController.text.isNotEmpty){
                        cubit.sendPublicPost(
                          text:postController.text,
                        );
                      }
                    }
                  },
                  text: 'send post',
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BuildContainer extends StatelessWidget {
  const BuildContainer({super.key, this.icon, this.onTap, this.color, this.width});
  final IconData? icon;
  final Color? color;
  final double? width;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: context.height * 0.19,
        width: width,
        decoration: BoxDecoration(
          color: color ?? AppColors.lightGreen,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon),
      ),
    );
  }
}
class ShowImage extends StatelessWidget {
  const ShowImage({super.key, required this.image});
 final File image ;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: context.height * 0.19,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ) ,
        child: Image.file(image,
         fit:BoxFit.cover ,
        ),
      ),
    );
  }
}

