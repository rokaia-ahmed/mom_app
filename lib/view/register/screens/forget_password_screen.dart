import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/core/utils/component.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/utils/navigator.dart';
import 'package:mom_app/core/widgets/custom_appbar.dart';
import 'package:mom_app/core/widgets/custom_text_form_field.dart';
import 'package:mom_app/view/register/cubit/register_cubit.dart';
import 'package:mom_app/view/register/cubit/register_states.dart';
import 'package:mom_app/view/register/screens/verify_email_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(context.height * 0.08),
        child: const CustomAppbar(title: 'Forget Password',),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key:formKey ,
            child: Column(
              children: [
                Image.asset('assets/images/password.png',
                  width: context.width,
                  height: context.height * 0.3,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: context.height * 0.01,
                ),
                Text(
                  'Forgot Password?',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: context.height * 0.01,
                ),
                Text(
                  'Don\'t worry! it happens. Please check your email account to reset your password.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,

                  ),
                ),
                SizedBox(
                  height: context.height * 0.03,
                ),
                CustomTextFormField(
                  hintText: 'Email Address',
                  visible: false,
                  controller: emailController,
                  valid: (value) {
                    if (value!.isEmpty) {
                      return 'email should not empty';
                    }else if(!value.contains('@gmail.com')){
                      return 'email should be valid email';
                    }
                    else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: context.height * 0.03,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: context.height * 0.07,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text('Cancel',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.width * 0.03,
                    ),
                    BlocConsumer<RegisterCubit, RegisterStates>(
                      listener:(context, state){
                        if(state is SendEmailSuccessState){
                          AppNavigator.push(context: context,
                              screen:  VerifyEmailScreen(
                                email:emailController.text ,
                              ),
                          );
                        }
                        if(state is SendEmailErrorState){
                          RegisterCubit cubit = RegisterCubit.get(context);
                          if(cubit.errorSendEmail.isNotEmpty){
                            showToast(text: cubit.errorSendEmail,
                                state: ToastStates.error);
                          }else{
                            showToast(text: 'error in request',
                                state: ToastStates.error);
                          }
                        }
                      } ,
                      builder: (context, state) {
                        RegisterCubit cubit = RegisterCubit.get(context);
                        return Expanded(
                          child: InkWell(
                            onTap: () {
                              if(formKey.currentState!.validate()) {
                                cubit.sendEmail(email: emailController.text,
                              );
                              }
                            },
                            child: Container(
                              height: context.height * 0.07,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Text('Next',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
