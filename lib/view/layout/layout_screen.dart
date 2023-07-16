import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_app/view/Home/screens/cubit/Cubit.dart';
import '../Home/screens/cubit/states.dart';

class LayoutScreen extends StatelessWidget {
   const LayoutScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) =>HomeCubit(),
      child:BlocConsumer<HomeCubit,HomeStates>(
        listener: (BuildContext context,HomeStates state){},
        builder: (BuildContext context,HomeStates state){
          var cubit=HomeCubit.get(context);
          return  Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,

             onTap: (index){
               cubit.ChangeIndex(index);
             }, items:cubit.screenItems
            ),
          );
        },
      ),
    );
  }
}
