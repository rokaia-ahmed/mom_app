import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/widgets/custom_button.dart';
import 'package:mom_app/core/widgets/custom_text_form_field.dart';

import '../../../core/widgets/custom_appbar.dart';

class BabyProfileScreen extends StatelessWidget {
  const BabyProfileScreen({Key? key}) : super(key: key);

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(alignment: Alignment.center, children: [
                  const CircleAvatar(
                    backgroundColor: AppColors.gray,
                    radius: 50,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_a_photo_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ]),
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
              const CustomTextFormField(
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
              Row(
                children: [
                  CustomTextFormField(
                    hintText: 'DD/MM/YYYY',
                    width: context.width * 0.5,
                  ),
                  const Spacer(),
                  InkWell(
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: AppColors.lightGreen,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.date_range),
                    ),
                  ),
                ],
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
                  Spacer(),
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
                    hintText: 'Baby sex',
                    width: context.width * 0.5,
                  ),
                  const Spacer(),
                  CustomTextFormField(
                    hintText: '12',
                    width: context.width * 0.12,
                  )
                ],
              ),
              SizedBox(
                height: context.height * 0.1,
              ),
              CustomButton(
                onTap: () {},
                child: Center(
                  child: Text(
                    'Save',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                    ),
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
