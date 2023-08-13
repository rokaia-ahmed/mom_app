
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/widgets/app_bar.dart';
import '../../../../../../core/widgets/top_screen_color_line.dart';
import '../../Home/cubit/Cubit.dart';
import '../../Home/cubit/states.dart';
import 'document.dart';
import 'lastVisit.dart';

class MedicalHistory extends StatelessWidget {
  const MedicalHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>HomeCubit(),
      child:BlocConsumer<HomeCubit,HomeStates>(
        listener: (BuildContext context,HomeStates state){},
        builder: (BuildContext context,HomeStates state){
          var cubit=HomeCubit.get(context);
          return  Scaffold(
              appBar: defaultAppBar(context: context,title: "Medical History"),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    // scrollDirection: Axis.vertical,
                      children: [
                        SizedBox(
                          height: context.height*0.02,
                        ),
                        //top screen color
                        topScreenColorLine(color: AppColors.lightGreen),
                        SizedBox(
                          height: context.height*0.005,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              medicalSections(cubit: cubit,text: "Last visit",index: 0),
                              SizedBox(width: 10.0,),
                              medicalSections(cubit: cubit,text: "Documents",index: 1),
                              SizedBox(height: 20.0,),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),

                        if(cubit.medicalHistoryIndex==0)LastVisit()
                        else if (cubit.medicalHistoryIndex==1) Document(),

                      ])));
        },
      ),
    );

  }
  Widget medicalSections({required cubit,required int index,required String text})
  {
    return Expanded(child: InkWell(
      onTap: (){
        cubit.changeMedicalHistory(index);
      },
      child: Container(
        height: 50.0,
        padding: EdgeInsets.all(5),
        // color: Colors.white,
        decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: cubit.medicalHistoryIndex==index?AppColors.lightGreen: Colors.white,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              // spreadRadius: 2,
              // blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Center(
          child: Text(text,
            style: GoogleFonts.poppins(
                color: AppColors.green
            ),),
        ),
      ),
    ));
  }

}
