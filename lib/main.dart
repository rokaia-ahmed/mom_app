import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_app/network/remote/dioHelper.dart';
import 'package:mom_app/view/Home/screens/home_screen.dart';
import 'package:mom_app/view/register/screens/signin_screen.dart';
import 'package:mom_app/view/splash/splash_screen.dart';

import 'core/utils/app_colors.dart';
import 'network/local/chacheHelper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  // await ChacheHelper.init();
  // Bloc.observer=my_bloc_observer();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,
      title: 'Mom',
      theme: ThemeData(
        primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
              foregroundColor: AppColors.green,
              elevation: 0.0,
              backgroundColor: Colors.white
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              type:  BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.green
          )
      ),
      home:  SignInScreen(),
    );
  }
}

