import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import '../../../../../../core/models/all_Medical_Record_model.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/widgets/custom_icon_button.dart';
import '../../../../../../core/widgets/overlay_entry_card.dart';
import 'cubit/tracker_cubit.dart';
import 'cubit/tracker_states.dart';

class LastVisit extends StatelessWidget {
   LastVisit({Key? key}) : super(key: key);
  var dateController=TextEditingController();
  var diagnosisController=TextEditingController();
  var doctorNameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>TrackerCubit()..getAllMedicalHistory(),
      child: BlocConsumer<TrackerCubit, TrackerStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit = TrackerCubit.get(context);
          final formKey = GlobalKey<FormState>();
          bool noData=false;
          return ConditionalBuilder(
            builder: (context) {
              if(cubit.getAllMedicalHistoryModel!.medicalRecords!.isNotEmpty)noData=true;
              if(state is AddActivityLoadingState){
                return const Center(child: CircularProgressIndicator());
              }
              else if(state is AllActivityLoadingState){
                return const Center(child: CircularProgressIndicator());
              }
              else if(state is UpdateActivityLoadingState){
                return const Center(child: CircularProgressIndicator());
              }
              else if(state is DeleteActivityLoadingState){
                return const Center(child: CircularProgressIndicator());
              }
              return Column(
                children: [

                   noData? ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder:(context, index) =>
                            lastVisitCard(context: context,index: index,model: cubit.getAllMedicalHistoryModel),
                        separatorBuilder:(context, index) => Container(
                          height: 2.0,
                          color: Colors.white,
                        ), itemCount: cubit.getAllMedicalHistoryModel!.medicalRecords!.length):const Center(child: Text("No Data set yet")),

                  const SizedBox(height: 20.0),
                  Center(
                    child: InkWell(
                      onTap:(){
                        overlayEntryCard(context: context,
                          color:AppColors.lightGreen,
                            icon1:customIconButton(onTap: (){}, isIcon: true,icon:Icons.date_range_outlined ),
                            cardText: 'Last visit',
                          text1: 'Date',
                          text2: 'Dr.Name',
                          text3: 'Diagnosis',
                          formKey: formKey,
                            controller1:dateController,
                            controller2: doctorNameController,
                            controller3:diagnosisController,
                            saveOnPressed: (){
                          cubit.addMedicalHistory(doctorName: doctorNameController.text, date: dateController.text, diagnosis: diagnosisController.text);
                            } );
                      },
                      child: const Icon(Icons.add_circle,size: 40.0,color:AppColors.lightGreen),
                    ),
                  ),
                ],
              );
            }, condition:  (state is! AllActivityLoadingState),
              fallback:(context)=> const Center(child: CircularProgressIndicator())
          );


        },
      ),
    );
  }
  Widget lastVisitCard({required BuildContext context, GetAllMedicalHistoryModel? model,required int index}){
    return TextButton(
      onPressed: () {
        // AppNavigator.push(context: context,
        //   screen:  screen,
        // );
      },
      child:DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(

            color: Colors.white,
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              // spreadRadius: 2,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: SizedBox(
          width:context.width,
          height: context.height*.15,
          // padding: EdgeInsets.all(20.0),
          // color: Colors.green,
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //colored part
              DecoratedBox(
                decoration: const BoxDecoration(
                    color: AppColors.lightGreen,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                    )

                ),
                child: Container(
                  width:context.width*.05,
                  // color: Colors.green,
                ),
              ),
              SizedBox(
                width: context.width*0.02,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 10,top: 20,bottom: 20),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Dr.Name:${model?.medicalRecords?[index].doctorName}",style: const TextStyle(
                          color: AppColors.green
                      )),
                      const Spacer(),
                      Text("Diagnosis:${model?.medicalRecords?[index].diagnosis}",style: const TextStyle(
                          color: Colors.green,
                          fontSize: 12.0
                      )),
                    ],
                  ),
                ),
              ),
              // SizedBox(width: 5.0,),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 20,bottom: 20,right: 10),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Age:${model?.medicalRecords?[index].age}",style: const TextStyle(
                          color: Colors.green,
                          fontSize: 12.0,
                      ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Text("Due date:${model?.medicalRecords?[index].date}",style: const TextStyle(
                          color: AppColors.green,
                          fontSize: 12.0
                      ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ) ,
    );
  }
}
