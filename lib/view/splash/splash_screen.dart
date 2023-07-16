import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import '../../core/utils/navigator.dart';
import '../Onboarding/screens/onboarding_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),
          ()=>AppNavigator.push(
        context: context,
        screen: const OnBoardingScreen(),
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
