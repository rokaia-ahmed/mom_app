
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/core/utils/component.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/utils/navigator.dart';
import 'package:mom_app/core/utils/validation.dart';
import 'package:mom_app/core/widgets/custom_button.dart';
import 'package:mom_app/core/widgets/custom_text_form_field.dart';
import 'package:mom_app/view/Baby_Info/cubit/baby_cubit.dart';
import 'package:mom_app/view/Baby_Info/cubit/baby_state.dart';
import 'package:mom_app/view/layout/layout_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../core/widgets/custom_appbar.dart';

class BabyProfileScreen extends StatefulWidget {
    const BabyProfileScreen({Key? key, }) : super(key: key);

  @override
  State<BabyProfileScreen> createState() => _BabyProfileScreenState();
}

class _BabyProfileScreenState extends State<BabyProfileScreen> {
  final nameBabyController =TextEditingController();

  final birthDateController =TextEditingController();

  final wightController =TextEditingController();
  final formKey = GlobalKey<FormState>();

  void buildDatePicker (){
  showDatePicker(context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime.now(),
  ).then((value){
    if(value !=null){
      birthDateController.text = formatDate(value, [yyyy, '-', mm, '-', dd]);
      print(formatDate(value, [yyyy, '-', mm, '-', dd]));
    }else {
      birthDateController.text ='0000-00-00';
    }
  });
}
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
                var cubit = BabyCubit.get(context);
                if(state is AddBabySuccessState){
                 showToast(text: 'Baby info is added',
                     state: ToastStates.success) ;
                 AppNavigator.push(
                     context: context,
                     screen: const LayoutScreen());
                }
                if(state is AddBabyErrorState){
                  showToast(text: cubit.errorAddBaby,
                      state: ToastStates.error) ;
                }
              },
              builder: (context, state) {
                var cubit = BabyCubit.get(context);
                  String gender ='girl';
                return Form(
                  key: formKey,
                  child: Column(
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
                        valid: (v) {
                          if (v!.isEmpty) {
                            return 'Name should not empty';
                          }else if(!v.isValidName){
                            return 'enter valid name ';
                          } else {
                            return null;
                          }
                        },
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
                        valid: (v) {
                          if (v!.isEmpty) {
                            return 'date should not empty';
                          }else if(!v.isValidDate){
                            return 'enter valid date (yyyy-mm-dd) ';
                          } else {
                            return null;
                          }
                        },
                        hintText: 'YYYY-MM-DD',
                        suffixIcon: InkWell(
                          onTap: () {
                            print('done');
                            buildDatePicker();
                          },
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
                          ToggleSwitch(
                            minWidth: 120.0,
                            initialLabelIndex: 1,
                            cornerRadius: 8.0,
                            activeFgColor: AppColors.green,
                            inactiveBgColor: AppColors.lightGreen,
                            inactiveFgColor: Colors.grey,
                            totalSwitches: 2,
                            labels: const ['Boy', 'Girl'],
                            activeBgColors: const [[Colors.white],[Colors.white]],
                            onToggle: (index) {
                              if(index==0){
                                gender = 'boy';
                              }else{
                                gender = 'girl';
                              }
                              print('switched to: $index,$gender');
                            },
                          ),
                          const Spacer(),
                          CustomTextFormField(
                            controller: wightController,
                            visible: false,
                            hintText: '0',
                            inputFormatters: [FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9]'),
                            ),],
                            keyboardType: TextInputType.number,
                            width: context.width * 0.12,
                          )
                        ],
                      ),
                      SizedBox(
                        height: context.height * 0.1,
                      ),
                      CustomButton(
                        onTap: (){
                          if(formKey.currentState!.validate()){
                            cubit.addBaby(
                              babyName: nameBabyController.text,
                              gender: gender,
                              birthDate: birthDateController.text,
                              wight: wightController.text,
                            );
                          }
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
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
