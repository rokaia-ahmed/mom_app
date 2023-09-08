
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_app/core/network/cache_helper.dart';
import 'package:mom_app/core/network/dio_helper.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/view/community/cubit/cubit.dart';
import 'package:mom_app/view/register/cubit/register_cubit.dart';
import 'package:mom_app/view/splash/splash_screen.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await CacheHelper.init();
  DioHelper.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
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
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => CommunityCubit()..getAllPosts()
            ..getMyGroups()..getRecommendedGroups()
            ..getAllFriends()..getAllFriendsRequests()

        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Baby',
        theme: ThemeData(
            appBarTheme:  const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0.0,
                foregroundColor: AppColors.green
            ),
            primarySwatch:Colors.green,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.white,
              elevation: 2.0,
              selectedItemColor: AppColors.green,
              unselectedItemColor: AppColors.gray,

            )
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

