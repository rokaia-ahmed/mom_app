
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/utils/navigator.dart';
import 'package:mom_app/core/widgets/custom_button.dart';
import 'package:mom_app/core/widgets/custom_text_form_field.dart';
import 'package:mom_app/view/Baby_Info/cubit/baby_cubit.dart';
import 'package:mom_app/view/Baby_Info/cubit/baby_state.dart';
import 'package:mom_app/view/layout/layout_screen.dart';

import '../../../core/widgets/custom_appbar.dart';

class BabyProfileScreen extends StatelessWidget {
   BabyProfileScreen({Key? key}) : super(key: key);
  final nameBabyController =TextEditingController();
  final birthDateController =TextEditingController();
  final genderController =TextEditingController();
  final wightController =TextEditingController();
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
            create: (context)=>BabyCubit(),
            child: BlocConsumer<BabyCubit, BabyStates>(
              listener: (context, state) {
                if(state is AddBabySuccessState){
                 AppNavigator.push(
                     context: context,
                     screen: const LayoutScreen());
                }
              },
              builder: (context, state) {
                var cubit = BabyCubit.get(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child:
                      (cubit.image ==null) ?
                      Stack(
                          alignment: Alignment.center,
                          children: [
                        const CircleAvatar(
                          backgroundColor: AppColors.gray,
                          radius: 50,
                        ),
                        IconButton(
                          onPressed: () {
                            cubit.addImage();
                          },
                          icon: const Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                      ],
                      ):
                      CircleAvatar(
                        backgroundColor: AppColors.gray,
                        backgroundImage:FileImage(cubit.imageShow!) ,
                        radius: 50,
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    Text(
                      'What is your baby name?',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.01,
                    ),
                    CustomTextFormField(
                      controller:nameBabyController ,
                      visible: false,
                      hintText: 'Baby name',
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    Text(
                      'When is your baby birthday?',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.01,
                    ),
                    CustomTextFormField(
                      controller:birthDateController ,
                      visible: false,
                      hintText: 'DD/MM/YYYY',
                      suffixIcon: InkWell(
                        onTap: () {},
                        child: const Icon(Icons.date_range,
                          size: 22,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          'What is your baby sex?',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Wight',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.height * 0.01,
                    ),
                    Row(
                      children: [
                        CustomTextFormField(
                          controller:genderController ,
                          visible: false,
                          hintText: 'Baby sex',
                          width: context.width * 0.5,
                        ),
                        const Spacer(),
                        CustomTextFormField(
                          controller: wightController,
                          visible: false,
                          hintText: '12',
                          width: context.width * 0.12,
                        )
                      ],
                    ),
                    SizedBox(
                      height: context.height * 0.1,
                    ),
                    CustomButton(
                      onTap: () {
                        cubit.addBaby(
                            babyName: nameBabyController.text,
                            gender: genderController.text,
                            birthDate: birthDateController.text,
                            wight: wightController.text,
                        );
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
                        child: CircularProgressIndicator(
                          color: Colors.white,
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
