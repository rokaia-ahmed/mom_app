import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/widgets/custom_button.dart';
import 'package:mom_app/view/Baby_Info/screens/welcome_screen.dart';
import 'package:mom_app/view/register/screens/signup_screen.dart';

import '../../../core/utils/navigator.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../widgets/divider.dart';
import 'forget_password_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/images/login.png',
                height: context.height * 0.25,
                width: context.width * 0.6,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                width: context.width,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: context.height * 0.01,
                      ),
                      Text(
                        'Welcome Back!',
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: context.height * 0.02,
                      ),
                      const CustomTextFormField(
                        hintText: 'Email Address',
                        width: double.infinity,
                      ),
                      SizedBox(
                        height: context.height * 0.02,
                      ),
                      const CustomTextFormField(
                        hintText: 'Password',
                        width: double.infinity,
                        suffixIcon:Icon(Icons.visibility_off) ,
                      ),
                      SizedBox(
                        height: context.height * 0.01,
                      ),
                      InkWell(
                        onTap:(){
                          AppNavigator.push(
                              context: context,
                              screen: const ForgetPasswordScreen());
                        } ,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'Forgot Password?',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: context.height * 0.01,
                      ),
                      CustomButton(
                        onTap:(){
                          AppNavigator.push(context: context,
                              screen: const WelcomeScreen());
                        } ,
                        child:Center(
                          child: Text(
                            'Login',
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ) ,
                      ),
                      SizedBox(
                        height: context.height * 0.02,
                      ),
                      const CustomDivider(),
                      SizedBox(
                        height: context.height * 0.02,
                      ),
                      CustomButton(
                        onTap:(){} ,
                        child:Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/google.png',
                                width:20 ,
                                height:20,
                              ),
                              const SizedBox(
                                width:10 ,
                              ),
                              Text(
                                'Login with google',
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ) ,
                      ),
                      SizedBox(
                        height: context.height * 0.015,
                      ),
                      CustomButton(
                        onTap:(){} ,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/facebook.png',
                              width:25 ,
                              height:25,
                            ),
                            const SizedBox(
                              width:10 ,
                            ),
                            Text(
                              'Login with Facebook',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ) ,
                      ),
                      SizedBox(
                        height: context.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          const Text('Don’t have account?',
                            style:TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ) ,
                          ),
                          TextButton(onPressed: (){
                            AppNavigator.push(context: context,
                                screen:  SignupScreen());
                          },
                            child:const Text('Sign up',
                              style:TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ) ,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
