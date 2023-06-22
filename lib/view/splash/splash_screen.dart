import 'package:flutter/material.dart';
import 'package:mom_app/core/utils/media_query_values.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
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
