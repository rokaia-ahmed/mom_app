import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/utils/navigator.dart';
import 'package:mom_app/core/widgets/custom_appbar.dart';
import 'package:mom_app/core/widgets/custom_text_form_field.dart';
import 'package:mom_app/view/register/screens/verify_email_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(context.height*0.08),
        child: const CustomAppbar(title: 'Forget Password',),
      ) ,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Image.asset('assets/images/password.png',
              width: context.width,
               height: context.height*0.3,
              alignment: Alignment.center,
            ),
            SizedBox(
              height: context.height*0.01,
            ),
            Text(
              'Forgot Password?',
              style: GoogleFonts.poppins(
                fontSize: 20,
                color:Colors.white ,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: context.height*0.01,
            ),
            Text(
              'Don\'t worry! it happens. Please check your email account to reset your password.',
               textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color:Colors.white ,

              ),
            ),
            SizedBox(
              height: context.height*0.03,
            ),
            const CustomTextFormField(hintText:'Email Address'),
            SizedBox(
              height: context.height*0.03,
            ),
            Row(
              children: [
              Expanded(
                  child: InkWell(
                    onTap:(){
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: context.height*0.07,
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ) ,
                      child:Center(
                        child: Text('Cancel',
                          style:GoogleFonts.poppins(
                            fontSize: 18,
                          ) ,
                        ),
                      ) ,
                    ),
                  ),
                ),
              SizedBox(
               width: context.width*0.03,
                ),
              Expanded(
                  child: InkWell(
                    onTap:(){
                      AppNavigator.push(context: context,
                          screen: const VerifyEmailScreen());
                    },
                    child: Container(
                      height: context.height*0.07,
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ) ,
                      child:Center(
                        child: Text('Next',
                          style:GoogleFonts.poppins(
                            fontSize: 18,
                          ) ,
                        ),
                      ) ,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
