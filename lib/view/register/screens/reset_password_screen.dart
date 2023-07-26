import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/component.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/utils/navigator.dart';
import 'package:mom_app/core/widgets/custom_text_form_field.dart';
import 'package:mom_app/view/register/cubit/register_cubit.dart';
import 'package:mom_app/view/register/cubit/register_states.dart';
import 'package:mom_app/view/register/screens/password_changed_screen.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_button.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({required this.code,
    required this.email,
    Key? key}) : super(key: key);
  final newPassWord = TextEditingController();
  final conNewPassWord = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final String code;
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RestPasswordSuccessState) {
          AppNavigator.push(
            context: context,
            screen: const PasswordChangedScreen(),
          );
        }
        if (state is RestPasswordErrorState) {
          showToast(text: 'request is failed',
              state: ToastStates.error);
        }
      },
      builder: (context, state) {
        var cubit = RegisterCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(context.height * 0.08),
            child: const CustomAppbar(title: 'Reset Password',),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: context.height * 0.012,
                    ),
                    Text('Please Enter the the new password'
                        'for your account',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.07,
                    ),
                    CustomTextFormField(
                      visible: cubit.visible,
                      hintText: 'New password',
                      controller: newPassWord,
                      valid: (value) {
                        if (value!.isEmpty) {
                          return 'password should not empty';
                        } else if (value.length < 8) {
                          return 'password must be >= 8 character';
                        }
                        else {
                          return null;
                        }
                      },
                      suffixIcon: IconButton(
                        icon: cubit.visible
                            ? const Icon(Icons.visibility_outlined)
                            : const Icon(Icons.visibility_off_outlined),
                        onPressed: () {
                          cubit.changePasswordVisibility();
                        },
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.03,
                    ),
                    CustomTextFormField(
                      controller: conNewPassWord,
                      visible: cubit.visible,
                      valid: (value) {
                        if (value!.isEmpty) {
                          return 'password should not empty';
                        } else if (value.length < 8) {
                          return 'password must be >= 8 character';
                        } else if (value != newPassWord.text) {
                          return 'password must match';
                        }
                        else {
                          return null;
                        }
                      },
                      hintText: 'Confirm new password',
                      suffixIcon: IconButton(
                        icon: cubit.visible
                            ? const Icon(Icons.visibility_outlined)
                            : const Icon(Icons.visibility_off_outlined),
                        onPressed: () {
                          cubit.changePasswordVisibility();
                        },
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.08,
                    ),
                    CustomButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          cubit.resetPassword(
                            password: newPassWord.text,
                            code: code,
                            email: email,
                          );
                        }
                      },
                      child: Center(
                        child: Text('Reset password',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
