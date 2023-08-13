
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_app/core/widgets/app_bar.dart';

import '../Home/cubit/Cubit.dart';
import '../Home/cubit/states.dart';
import 'HaveNotification.dart';


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
            appBar: defaultAppBar(context: context, title: "Notification"),
            body: cubit.notification?const HaveNotification():Column(
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
