import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/utils/navigator.dart';
import 'package:mom_app/core/widgets/custom_text_form_field.dart';
import 'package:mom_app/view/register/screens/password_changed_screen.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_button.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(context.height*0.08),
        child: const CustomAppbar(title: 'Reset Password',),
      ) ,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: context.height*0.012,
              ),
              Text('Please Enter the the new password'
                'for your account',
                textAlign:TextAlign.center ,
                style:GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white,
                ) ,
              ),
              SizedBox(
                height: context.height*0.07,
              ),
              const CustomTextFormField(
                hintText: 'New password',
                suffixIcon:Icon(Icons.visibility_off_rounded) ,
              ),
              SizedBox(
                height: context.height*0.03,
              ),
              const CustomTextFormField(
                hintText: 'Confirm new password',
                suffixIcon:Icon(Icons.visibility_off_rounded) ,
              ),
              SizedBox(
                height: context.height*0.08,
              ),
              CustomButton(
                onTap: (){
                  AppNavigator.push(
                      context: context,
                      screen: const PasswordChangedScreen(),
                  );
                },
                child:Center(
                  child: Text('Reset password',
                    textAlign:TextAlign.center ,
                    style:GoogleFonts.poppins(
                      fontSize: 18,
                    ) ,
                  ),
                ) ,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
