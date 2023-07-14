import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/view/Home/screens/bottomNavBarScreens/community/events.dart';
import 'package:mom_app/view/Home/screens/bottomNavBarScreens/community/groups.dart';
import 'package:mom_app/view/Home/screens/bottomNavBarScreens/community/posts.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../cubit/Cubit.dart';
import '../../cubit/states.dart';
import '../../home_screen.dart';
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
              appBar: AppBar(
                title: const Center(
                  child: Text("Community",style: TextStyle(

                  ),),
                ),
                leading: IconButton( onPressed: () {
                  AppNavigator.push(context: context,
                    screen:  HomeScreen(),
                  );
                }, icon:Icon( Icons.arrow_back_ios)),
              ),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    //community sections
                    Container(
                      height:70.0 ,
                      width: double.infinity,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: Container(
                              // color: Colors.white,
                              decoration: BoxDecoration(
                                color:cubit.communityIndex==0?  AppColors.primaryColor:Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: cubit.communityIndex==0?Colors.white: Colors.grey.shade400,
                                  width: 1,
                                ),
                              ),
                              child: TextButton(onPressed: (){
                                cubit.changeCommunity(0);
                              }, child: Text("Posts",
                                style: GoogleFonts.poppins(
                                    color: AppColors.green
                                ),)),
                            )),
                            SizedBox(
                              width: 5.0,
                            ),
                            Expanded(
                              child: Container(
                                // color: Colors.white,
                                decoration: BoxDecoration(
                                  color:cubit.communityIndex==1?  AppColors.primaryColor:Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: cubit.communityIndex==1?Colors.white: Colors.grey.shade400,
                                    width: 1,
                                  ),
                                ),
                                child: TextButton(onPressed: (){
                                  cubit.changeCommunity(1);
                                }, child: Text("Groups",
                                  style: GoogleFonts.poppins(
                                      color: AppColors.green
                                  ),)),
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Expanded(child: Container(
                              // color: Colors.white,
                              decoration: BoxDecoration(
                                color:cubit.communityIndex==2?  AppColors.primaryColor:Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: cubit.communityIndex==2?Colors.white: Colors.grey.shade400,
                                  width: 1,
                                ),
                              ),
                              child: TextButton(onPressed: (){
                                cubit.changeCommunity(2);
                              }, child: Text("Events",
                                style: GoogleFonts.poppins(
                                    color: AppColors.green
                                ),)),
                            )),
                            SizedBox(
                              width: 5.0,
                            ),
                            Expanded(child: Container(
                              // color: Colors.white,
                              decoration: BoxDecoration(
                                color:cubit.communityIndex==3?  AppColors.primaryColor:Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: cubit.communityIndex==3?Colors.white: Colors.grey.shade400,
                                  width: 1,
                                ),
                              ),
                              child: TextButton(onPressed: (){
                                cubit.changeCommunity(3);
                              }, child: Text("Freinds",
                                style: GoogleFonts.poppins(
                                    color: AppColors.green
                                ),)),
                            )),
                          ],
                        ),
                      ),
                    ),
                    //divide line
                    Container(
                      height: 1.0,
                        width: double.infinity,
                      color: Colors.grey.shade400,
                    ),
                     //search
                    if(cubit.communityIndex==0) Posts(searchcontroller,context)
                    else if (cubit.communityIndex==1) groups(context)
                    else if (cubit.communityIndex==2) event(context)
                      else if (cubit.communityIndex==3) friends(context)
                  ],
                ),
              )
          );
        },
      ),
    );

  }
}
