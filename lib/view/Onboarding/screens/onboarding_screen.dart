import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/utils/navigator.dart';
import 'package:mom_app/view/register/cubit/register_cubit.dart';
import 'package:mom_app/view/register/screens/signup_screen.dart';
import '../../../core/widgets/custom_button.dart';
import '../../register/screens/signin_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: context.height * 0.1,
              ),
              Text('Keep tracking your baby, '
                  'and shop form all your'
                  'favorite brands'.toUpperCase(),
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: context.height * 0.05,
              ),
              Image.asset('assets/images/on_boarding.png'),
              SizedBox(
                height: context.height * 0.1,
              ),
              CustomButton(
                onTap: () {
                  AppNavigator.push(context: context,
                    screen: SignupScreen(),
                  );
                },
                child: const Center(
                  child: Text('Signup',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have account',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextButton(onPressed: () {
                    AppNavigator.push(context: context,
                        screen: SignInScreen());
                  },
                    child: const Text('login',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
