import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/widgets/app_bar.dart';
import 'package:mom_app/view/community/cubit/states.dart';
import 'package:mom_app/view/community/screens/posts.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../layout/layout_screen.dart';
import '../cubit/cubit.dart';
import 'events.dart';
import 'freinds.dart';
import 'groups.dart';



class Community extends StatelessWidget {
   const Community({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommunityCubit, CommunityStates>(
      listener: (BuildContext context,  state) {},
      builder: (BuildContext context,  state) {
        var cubit = CommunityCubit.get(context);
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: defaultAppBar(
                context: context,
                title: "Community",
                screen: const LayoutScreen()),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  //community sections
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommunitySections(
                            cubit: cubit, text: "Posts", index: 0),
                        const SizedBox(
                          width: 5.0,
                        ),
                        CommunitySections(
                            cubit: cubit, text: "Groups", index: 1),
                        const SizedBox(
                          width: 5.0,
                        ),
                        CommunitySections(
                            cubit: cubit, text: "Events", index: 2),
                        const SizedBox(
                          width: 5.0,
                        ),
                        CommunitySections(
                            cubit: cubit, text: "Friends", index: 3),
                      ],
                    ),
                  ),
                  //divide line
                  Container(
                    height: 1.0,
                    width: double.infinity,
                    color: Colors.grey.shade400,
                  ),
                  //search
                  if (cubit.communityIndex == 0)
                    Posts()
                  else if (cubit.communityIndex == 1)
                     Groups()
                  else if (cubit.communityIndex == 2)
                      const Event()
                  else if (cubit.communityIndex == 3)
                      const Friends()
                ],
              ),
            ));
      },
    );
  }
}
class CommunitySections extends StatelessWidget {
  const CommunitySections({super.key,
    required this.index,
    required this.text,
    required this.cubit});
  final int index ;
  final String text ;
  final CommunityCubit cubit ;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          cubit.changeCommunity(index);
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          // color: Colors.white,
          decoration: BoxDecoration(
            color: cubit.communityIndex == index
                ? AppColors.primaryColor
                : Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: cubit.communityIndex == index
                  ? Colors.white
                  : Colors.grey.shade400,
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.poppins(color: AppColors.green),
            ),
          ),
        ),
      ),
    );
  }
}

