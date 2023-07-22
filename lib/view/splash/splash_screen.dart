import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import '../../core/network/cache_helper.dart';
import '../../core/utils/navigator.dart';
import '../Baby_Info/screens/welcome_screen.dart';
import '../Onboarding/screens/onboarding_screen.dart';
import '../layout/layout_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget? startScreen ;


  @override
  void initState() {
    super.initState();

    if(CacheHelper.getData()!.accessToken != null &&
        CacheHelper.getData()!.baby.isEmpty) {
      startScreen = const WelcomeScreen();
    } else if (CacheHelper.getData()!.baby.isNotEmpty){
      startScreen = const LayoutScreen();
    }
    else{
      startScreen = const OnBoardingScreen();
    }
      Timer(const Duration(seconds: 5),
            () =>
            AppNavigator.push(
              context: context,
              screen:  startScreen!,
            ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset('assets/images/splash.png',
          width:context.width*0.6 ,
           height:context.height*0.5 ,
            fit: BoxFit.cover,
          ),
      ),
    );
  }
}
