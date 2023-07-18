import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/network/cache_helper.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/widgets/custom_button.dart';
import 'package:mom_app/view/register/screens/signup_screen.dart';
import '../../../core/utils/component.dart';
import '../../../core/utils/navigator.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../Baby_Info/screens/welcome_screen.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_states.dart';
import '../widgets/divider.dart';
import 'forget_password_screen.dart';



class SignInScreen extends StatelessWidget {
   SignInScreen({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (BuildContext context, RegisterStates state) {
        if (state is SignInSuccessState) {
          var cubit = RegisterCubit.get(context);
          showToast(
            text: 'login is success',
            state: ToastStates.success,
          );
          CacheHelper.saveData(key:'token',
            value:cubit.userModel!.accessToken ,
          );
          CacheHelper.saveData(key:'email',
            value:cubit.userModel!.email ,).then((value){
            AppNavigator.push(context: context,
                screen: const WelcomeScreen());
          });
        } else if(state is SignInErrorState) {
          showToast(
            text: 'login is failed',
            state: ToastStates.error,
          );
        }
      },
      builder: (BuildContext context, RegisterStates state) {
        var cubit = RegisterCubit.get(context);
        return Scaffold(
          body: Form(
            key: formKey,
            child: SafeArea(
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
                            CustomTextFormField(
                              hintText: 'Email Address',
                              valid: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email must not be empty';
                                }else if(!value.contains('@gmail.com')){
                                  return 'email should be email';
                                }
                                return null;
                              },
                              controller: emailController,
                              width: double.infinity,
                            ),
                            SizedBox(
                              height: context.height * 0.02,
                            ),
                            CustomTextFormField(
                              visible: cubit.visible,
                              valid: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password must not be empty';
                                }else if(value.length<8){
                                  return 'password must be >= 8';
                                }
                                return null;
                              },
                              controller: passwordController,
                              hintText: 'Password',
                              width: double.infinity,
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
                              height: context.height * 0.01,
                            ),
                            InkWell(
                              onTap: () {
                                AppNavigator.push(
                                    context: context,
                                    screen:  ForgetPasswordScreen());
                              },
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
                            ConditionalBuilder(
                              condition: state is!  SignInLoadingState,
                              builder: (BuildContext context) => CustomButton(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.userSignIn(
                                        email: emailController.text,
                                        password: passwordController.text,
                                    );
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              fallback: (BuildContext context) =>
                                  const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      )),
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
                                    Image.asset(
                                      'assets/images/google.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Login with google',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
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
                                  Image.asset(
                                    'assets/images/facebook.png',
                                    width: 25,
                                    height: 25,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Login with Facebook',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: context.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Don’t have account?',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    AppNavigator.push(
                                        context: context,
                                        screen: SignupScreen());
                                  },
                                  child: const Text(
                                    'Signup',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
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
          ),
        );
      },
    );
  }
}
