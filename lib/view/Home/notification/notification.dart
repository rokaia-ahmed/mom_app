import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_app/view/Home/notification/HaveNotification.dart';
import 'package:mom_app/view/Home/screens/cubit/Cubit.dart';
import 'package:mom_app/view/Home/screens/cubit/states.dart';
import 'package:mom_app/view/Home/screens/home_screen.dart';

import '../../../core/utils/navigator.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>HomeCubit(),
      child:BlocConsumer<HomeCubit,HomeStates>(
        listener: (BuildContext context,HomeStates state){},
        builder: (BuildContext context,HomeStates state){
          var cubit=HomeCubit.get(context);


          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Center(
                child: Text("Notification",style: TextStyle(

                ),),
              ),
              leading: IconButton( onPressed: () {
                AppNavigator.push(context: context,
                  screen:  HomeScreen(),
                );
              }, icon:Icon( Icons.arrow_back_ios)),
            ),
            body: cubit.notification?HaveNotification():Column(
              children: [

                Center(
                  child: Image.network("https://www.kindpng.com/picc/m/208-2080049_no-new-notification-no-notification-png-transparent-png.png",
                    height:200 ,
                  width: 200,)
                  // Image.asset('assets/images/No_Notification.png',
                  //   width: 220,
                  //   height: 220,
                  //   ),
                )

              ],
            ),
          );
        },
      ),
    );
  }
}