import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/utils/navigator.dart';
import 'package:mom_app/core/widgets/custom_appbar.dart';
import 'package:mom_app/core/widgets/custom_button.dart';
import 'package:mom_app/view/register/screens/reset_password_screen.dart';
import 'package:mom_app/view/register/widgets/verify_email_widget.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: PreferredSize(
         preferredSize:Size.fromHeight(context.height*0.08) ,
          child: const CustomAppbar(title: 'Verify Email',),
      ),
      body:Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: context.height*0.012,
              ),
              Text('Please Enter the 4 digit code we '
               'sent you via Email',
                textAlign:TextAlign.center ,
                style:GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white,
                ) ,
              ),
              SizedBox(
                height: context.height*0.12,
              ),
              const VerifyEmailWidget(),
              SizedBox(
                height: context.height*0.06,
              ),
              CustomButton(
                onTap: (){
                  AppNavigator.push(
                      context: context,
                      screen: const ResetPasswordScreen());
                },
                child:Center(
                  child: Text('Verify',
                    textAlign:TextAlign.center ,
                    style:GoogleFonts.poppins(
                      fontSize: 18,
                    ) ,
                  ),
                ) ,
              ),
              SizedBox(
                height: context.height*0.012,
              ),
              InkWell(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text('Resend code',
                    style:GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white,
                    ) ,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
