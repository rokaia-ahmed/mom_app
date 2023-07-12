import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/widgets/custom_text_form_field.dart';
import 'package:mom_app/view/register/screens/signin_screen.dart';
import '../../../core/network/cache_helper.dart';
import '../../../core/utils/component.dart';
import '../../../core/utils/navigator.dart';
import '../../../core/widgets/custom_button.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_states.dart';
import '../widgets/divider.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        RegisterCubit cubit = BlocProvider.of(context);
        if(state is SignUpSuccessState) {
          showToast(
            text: 'Signup is success',
            state: ToastStates.success,
          );
          CacheHelper.saveData(key:'token',
            value:cubit.userModel!.accessToken ,
          );
          CacheHelper.saveData(key:'email',
            value:cubit.userModel!.email ,).then((value){
            AppNavigator.push(context: context,
                screen: SignInScreen());
          });
        }else if(state is SignUpErrorState){
          showToast(
            text: 'Signup is failed',
            state: ToastStates.error,
          );
        }
      },
      builder: (context, state) {
        RegisterCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: Column(
            children: [
              Image.asset('assets/images/signup.png',
                height: context.height * 0.27,
                width: context.width,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
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
                            width: context.width * 0.7,
                            child: Text(
                              'Create an account with email to login form anywhere.',
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.white,
                                height: 1,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: context.height * 0.03,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                  hintText: 'First name',
                                  visible: false,
                                  controller: fNameController,
                                  valid: (v) {
                                    if (v!.isEmpty) {
                                      return 'fName should not empty';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                width: context.width * 0.03,
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                  hintText: 'Last name',
                                  visible: false,
                                  controller: lNameController,
                                  valid: (v) {
                                    if (v!.isEmpty) {
                                      return 'lName should not empty';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: context.height * 0.02,
                          ),
                          CustomTextFormField(
                            visible: false,
                            hintText: 'Email Address',
                            controller: emailController,
                            width: double.infinity,
                            valid: (v) {
                              if (v!.isEmpty) {
                                return 'email should not empty';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: context.height * 0.02,
                          ),
                          CustomTextFormField(
                            visible: false,
                            hintText: 'Password',
                            controller: passwordController,
                            width: double.infinity,
                            suffixIcon: const Icon(
                                Icons.visibility_off_rounded),
                            valid: (v) {
                              if (v!.isEmpty) {
                                return 'password should not empty';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: context.height * 0.03,
                          ),
                          ConditionalBuilder(
                            condition:(state is !SignInLoadingState) ,
                            builder:(context){
                              return CustomButton(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.userSignUp(
                                      firstName: fNameController.text,
                                      lastName: lNameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    'Sign up',
                                    style: GoogleFonts.poppins(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              );
                            } ,
                           fallback:(context)=>const Center(
                               child: CircularProgressIndicator(
                                 color: Colors.white,
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
                            onTap: () {},
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/google.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    width: 10,
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
                            ),
                          ),
                          SizedBox(
                            height: context.height * 0.015,
                          ),
                          CustomButton(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/facebook.png',
                                  width: 25,
                                  height: 25,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Signup with Facebook',
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: context.height * 0.001,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Don’t have account?',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextButton(onPressed: () {
                                AppNavigator.push(context: context,
                                    screen:  SignInScreen());
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
                          SizedBox(
                            height: context.height * 0.02,
                          ),
                          SizedBox(
                            width: context.width * 0.79,
                            child: Text(
                              'By signing up, you agree to our Terms of'
                                  'Use and Privacy Policy.',
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Colors.white,
                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
