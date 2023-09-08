
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/widgets/custom_button.dart';
import 'package:mom_app/core/widgets/custom_text_form_field.dart';
import 'package:mom_app/view/Baby_Info/cubit/baby_state.dart';
import 'package:mom_app/view/register/cubit/register_states.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../cubit/register_cubit.dart';



class UpdateParentProfile extends StatelessWidget {
  UpdateParentProfile({Key? key, }) : super(key: key);
  final firstNameController =TextEditingController();
  final lastNameController =TextEditingController();
  final emailController =TextEditingController();
  final phoneController =TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: CustomAppbar(
          title: 'Baby profile',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context)=>RegisterCubit(),
            child: BlocConsumer<RegisterCubit, RegisterStates>(
              listener: (context, state) {
                // var cubit = BabyCubit.get(context);
                /*if(state is AddBabySuccessState){
                  showToast(text: 'Baby info is added',
                      state: ToastStates.success) ;
                  AppNavigator.push(
                      context: context,
                      screen: const LayoutScreen());
                }
                if(state is AddBabyErrorState){
                  showToast(text: 'error in data',
                      state: ToastStates.error) ;
                }*/
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child:
                     // (cubit.image ==null) ?
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          const CircleAvatar(
                            backgroundColor: AppColors.gray,
                            radius: 50,
                          ),
                          IconButton(
                            onPressed: () {
                             // cubit.addImage();
                            },
                            icon: const Icon(
                              Icons.add_a_photo_outlined,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        ],
                      )
                        /*  :
                      CircleAvatar(
                        backgroundColor: AppColors.gray,
                        backgroundImage:FileImage(cubit.imageShow!) ,
                        radius: 50,
                      ),*/
                    ),
                    SizedBox(
                      height: context.height * 0.03,
                    ),
                    CustomTextFormField(
                      controller:firstNameController ,
                      visible: false,
                      hintText: 'first name',
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    CustomTextFormField(
                      controller:lastNameController ,
                      visible: false,
                      hintText: 'last name',
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    CustomTextFormField(
                      controller:emailController ,
                      visible: false,
                      hintText: 'Email Adress',
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    CustomTextFormField(
                      controller:phoneController ,
                      visible: false,
                      hintText: 'Mobile number ',
                    ),
                    SizedBox(
                      height: context.height * 0.1,
                    ),
                    CustomButton(
                      onTap: (){
                      },
                      child: Center(
                        child: Text(
                          'Save',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    if(state is AddBabyLoadingState)
                      const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
