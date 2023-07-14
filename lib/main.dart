import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/view/Home/screens/chats.dart';
import 'package:mom_app/view/Home/screens/cubit/Cubit.dart';
import 'package:mom_app/view/Home/screens/home_screen.dart';
import 'package:mom_app/view/register/cubit/register_cubit.dart';
import 'package:mom_app/view/register/screens/signin_screen.dart';
import 'package:mom_app/view/splash/splash_screen.dart';

import 'core/network/dio_helper.dart';


void main() {
  WidgetsBinding widgetsBinding=WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => HomeCubit()),
        BlocProvider(
            create: (BuildContext context) => RegisterCubit()),
        // BlocProvider(
        //     create: (BuildContext context) => PlanetCubit()..getProductsData()),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner:false ,
        title: 'My Baby',
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0.0,
                foregroundColor: AppColors.green
            ),
            primarySwatch: Colors.blue,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.white,
              elevation: 2.0,
              selectedItemColor: AppColors.green,
              unselectedItemColor: AppColors.gray,

            )
        ),
        home:  HomeScreen(),
      ),
    );

  }
}

