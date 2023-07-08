import 'package:flutter/material.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/view/Home/screens/home_screen.dart';
import 'package:mom_app/view/register/screens/signin_screen.dart';
import 'package:mom_app/view/splash/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home:  SplashScreen(),
    );
  }
}

