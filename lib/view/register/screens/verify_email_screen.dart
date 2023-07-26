import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/core/utils/component.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/utils/navigator.dart';
import 'package:mom_app/core/widgets/custom_appbar.dart';
import 'package:mom_app/core/widgets/custom_button.dart';
import 'package:mom_app/view/register/cubit/register_cubit.dart';
import 'package:mom_app/view/register/cubit/register_states.dart';
import 'package:mom_app/view/register/screens/reset_password_screen.dart';
import 'package:mom_app/view/register/widgets/verify_email_widget.dart';

class VerifyEmailScreen extends StatelessWidget {
  VerifyEmailScreen({
    required this.email,
    Key? key}) : super(key: key);
  final String email;

  final num1 = TextEditingController();
  final num2 = TextEditingController();
  final num3 = TextEditingController();
  final num4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(context.height * 0.08),
        child: const CustomAppbar(title: 'Verify Email',),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: context.height * 0.012,
              ),
              Text('Please Enter the 4 digit code we '
                  'sent you via Email',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: context.height * 0.12,
              ),
              VerifyEmailWidget(
                num1: num1,
                num2: num2,
                num3: num3,
                num4: num4,
              ),
              SizedBox(
                height: context.height * 0.06,
              ),
              BlocConsumer<RegisterCubit, RegisterStates>(
                listener: (context, state) {
                  String code =
                      num1.text + num2.text + num3.text + num4.text;
                  if (state is VerifyEmailSuccessState) {
                    AppNavigator.push(
                        context: context,
                        screen: ResetPasswordScreen(
                          code: code,
                          email: email,
                        ));
                  }
                  if (state is VerifyEmailErrorState) {
                    showToast(
                        text: 'code is not valid',
                        state: ToastStates.error);
                  }
                },
                builder: (context, state) {
                  var cubit = RegisterCubit.get(context);
                  return CustomButton(
                    onTap: () {
                      String code =
                          num1.text + num2.text + num3.text + num4.text;
                      print(code);
                      if (code.isEmpty || code.length < 4) {
                        showToast(text: 'please enter 4 number',
                            state: ToastStates.error);
                      } else {
                        cubit.verifyEmail(
                          email: email,
                          code: code,
                        );
                      }
                    },
                    child: Center(
                      child: Text('Verify',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: context.height * 0.012,
              ),
              BlocConsumer<RegisterCubit, RegisterStates>(
                listener: (context, state) {
                },
                builder: (context, state) {
                  RegisterCubit cubit= BlocProvider.of(context);
                  return InkWell(
                    onTap: () {
                      cubit.sendEmail(email: email);
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text('Resend code',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
