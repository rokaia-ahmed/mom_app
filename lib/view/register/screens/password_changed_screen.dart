import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/utils/navigator.dart';
import 'package:mom_app/core/widgets/custom_button.dart';
import 'package:mom_app/view/register/screens/signin_screen.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: context.height*0.06,
                ),
                Text('Password changed'
                    '                    '
                  'Successfully!',
                  textAlign:TextAlign.center ,
                  style:GoogleFonts.poppins(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ) ,
                ),
                Image.asset('assets/images/pass_changed.png',

                ),
                SizedBox(
                  height: context.height*0.06,
                ),
                CustomButton(
                  onTap: (){
                    AppNavigator.push(context: context,
                        screen:  SignInScreen());
                  },
                  child:Center(
                    child: Text('Login',
                      textAlign:TextAlign.center ,
                      style:GoogleFonts.poppins(
                        fontSize: 20,
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
