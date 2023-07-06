import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/widgets/custom_text_form_field.dart';
import 'package:mom_app/view/register/screens/signin_screen.dart';

import '../../../core/utils/navigator.dart';
import '../../../core/widgets/custom_button.dart';
import '../widgets/divider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Image.asset('assets/images/signup.png',
            height: context.height*0.27,
            width: context.width,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Container(
              width: double.infinity ,
              padding: const EdgeInsets.all(15),
              decoration:const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                   topLeft: Radius.circular(40),
                ),
              ) ,
              child:SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'lets get started',
                      style: GoogleFonts.poppins(
                        fontSize: 33,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: context.width*0.7,
                      child: Text(
                        'Create an account with email to login form anywhere.',
                         textAlign:TextAlign.center,
                          maxLines: 2,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                          height:1,
                        ),
                      ),
                    ),
                    SizedBox(
                      height:context.height*0.03 ,
                    ),
                    Row(
                      children: [
                         Expanded(
                          child: CustomTextFormField(
                              hintText: 'First name',
                            visible: false,
                          ),
                        ),
                        SizedBox(
                          width:context.width*0.03 ,
                        ),
                         Expanded(
                          child: CustomTextFormField(
                            hintText: 'Last name',
                            visible: false,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height:context.height*0.02 ,
                    ),
                     CustomTextFormField(
                       visible: false,
                        hintText: 'Email Address',
                        width: double.infinity,
                    ),
                    SizedBox(
                      height:context.height*0.02 ,
                    ),
                     CustomTextFormField(
                       visible: false,
                      hintText: 'Password',
                      width: double.infinity,
                      suffixIcon:Icon(Icons.visibility_off_rounded) ,
                    ),
                    SizedBox(
                      height:context.height*0.03 ,
                    ),
                    CustomButton(
                      onTap:(){
                        AppNavigator.push(context: context,
                            screen: const SignInScreen());
                      } ,
                      child:Center(
                        child: Text(
                          'Sign up',
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
                              'Signup with google',
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
                            'Signup with Facebook',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ) ,
                    ),
                    SizedBox(
                      height: context.height * 0.001,
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
                              screen: const SignInScreen());
                        },
                          child:const Text('login',
                            style:TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ) ,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    SizedBox(
                      width: context.width*0.79,
                      child: Text(
                        'By signing up, you agree to our Terms of'
                        'Use and Privacy Policy.',
                        textAlign:TextAlign.center,
                        maxLines: 2,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.white,
                          height:1,
                        ),
                      ),
                    ),
                  ],
                ),
              ) ,
            ),
          ),
        ],
      ),
    );
  }
}
