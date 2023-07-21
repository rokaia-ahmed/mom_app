import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/widgets/app_bar.dart';
import 'package:mom_app/view/Home/screens/bottomNavBarScreens/community/events.dart';
import 'package:mom_app/view/Home/screens/bottomNavBarScreens/community/groups.dart';
import 'package:mom_app/view/Home/screens/bottomNavBarScreens/community/posts.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../cubit/Cubit.dart';
import '../../cubit/states.dart';
import '../../../../layout/layout_screen.dart';
import 'freinds.dart';
var searchcontroller = TextEditingController();
class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>HomeCubit(),
      child:BlocConsumer<HomeCubit,HomeStates>(
        listener: (BuildContext context,HomeStates state){},
        builder: (BuildContext context,HomeStates state){
          var cubit=HomeCubit.get(context);
          return  Scaffold(
            backgroundColor: Colors.white,
              appBar:defaultAppBar(context: context, title:"Community",screen: LayoutScreen()),
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
                          communitySections(cubit: cubit,text: "Posts",index: 0),
                          const SizedBox(
                            width: 5.0,
                          ),
                          communitySections(cubit: cubit,text: "Groups",index: 1),
                          SizedBox(
                            width: 5.0,
                          ),
                          communitySections(cubit: cubit,text: "Events",index: 2),
                          SizedBox(
                            width: 5.0,
                          ),
                          communitySections(cubit: cubit,text: "Friends",index: 3),
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
                    if(cubit.communityIndex==0) Posts(context: context,searchController: searchcontroller)
                    else if (cubit.communityIndex==1) groups(context: context)
                    else if (cubit.communityIndex==2) event(context: context)
                      else if (cubit.communityIndex==3) friends(context: context)
                  ],
                ),
              )
          );
        },
      ),
    );

  }
  Widget communitySections({required cubit,required int index,required String text})
  {
    return Expanded(child: InkWell(
      onTap: (){
        cubit.changeCommunity(index);
      },
      child: Container(
        padding: EdgeInsets.all(5),
        // color: Colors.white,
        decoration: BoxDecoration(
          color:cubit.communityIndex==index?  AppColors.primaryColor:Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: cubit.communityIndex==index?Colors.white: Colors.grey.shade400,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(text,
            style: GoogleFonts.poppins(
                color: AppColors.green
            ),),
        ),
      ),
    ));
  }
  }

