import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/view/community/cubit/cubit.dart';
import 'package:mom_app/view/community/cubit/states.dart';
import 'package:mom_app/view/community/models/recommended_group.dart';
import 'package:mom_app/view/community/screens/group_details.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/navigator.dart';
import '../../../../../../core/widgets/custom_icon_button.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/my_groups_widget.dart';
import 'all_my_groups.dart';

class Groups extends StatelessWidget {
  Groups({super.key});

  final TextEditingController createGroupController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommunityCubit, CommunityStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CommunityCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Row(
              children: [
                Text(
                  "All Groups",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: AppColors.green,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                //search icon
                customIconButton(
                    isIcon: true, icon: Icons.search_outlined, onTap: () {}),
                const SizedBox(
                  width: 5.0,
                ),
                //message icon
                customIconButton(
                  isIcon: true,
                  icon: Icons.add,
                  onTap: () => buildDialog(
                    context,
                    createGroupController,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Text(
                  "Your Groups",
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
                  color: Colors.green,
                  onTap: () {
                    AppNavigator.push(
                        context: context,
                        screen: AllMyGroups(
                          cubit: cubit,
                        ));
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            //you groups list
            MyGroupsWidget(
              lengthList:
              (cubit.myGroupsModel!.groups!.length > 3)
                  ? 3
                  : cubit.myGroupsModel!.groups!.length,
              scrollPhysics: const NeverScrollableScrollPhysics(),
            ),
            const SizedBox(
              height: 20,
            ),
            //recommended line
            Row(
              children: [
                Text(
                  "Recommended for you",
                  style: GoogleFonts.poppins(
                    color: AppColors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                const Spacer(),
                customIconButton(
                    isIcon: false,
                    text: "see all",
                    fontSize: 12.0,
                    color: Colors.green,
                    onTap: () {}),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            //grid view
            ConditionalBuilder(
                condition: cubit.recommendedGroups.isNotEmpty,
                builder: (context) {
                  return GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.07 / 1,
                      crossAxisCount: 2,
                      children: List.generate(
                          cubit.recommendedGroups.length,
                          (index) => buildGridView(
                              context, cubit.recommendedGroups[index])));
                },
                fallback: (context) {
                  if (state is GetRecommendedGroupsLoading) {
                   return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }else{
                     return const SizedBox();
                  }
                }
                ),
            //group style
          ]),
        );
      },
    );
  }

  Widget buildGridView(BuildContext context, RecommendedGroupModel model) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.greenAccent.shade200,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            child: (model.image != null)
                ? Image.network(
                    model.image!,
                    width: double.infinity,
                    height: context.height * 0.15,
                    fit: BoxFit.cover,
                    errorBuilder: (context, _, error) {
                      return Image.asset(
                        'assets/images/default_group.png',
                        color: Colors.grey,
                        fit: BoxFit.contain,
                        width: double.infinity,
                        height: context.height *0.15,
                      );
                    },
                  )
                : Image.asset(
                    'assets/images/default_group.png',
                    color: Colors.grey,
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: context.height * 0.15,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.groupName!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: AppColors.green,
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        "${model.count} members",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                          color: AppColors.green,
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    AppNavigator.push(
                        context: context,
                        screen: GroupDetails(
                          id: model.id!,
                          isMyGroups: false,
                        ));
                  },
                  child: const Icon(
                    Icons.add_circle_sharp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
