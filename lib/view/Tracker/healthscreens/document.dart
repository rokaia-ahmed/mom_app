import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/widgets/add_button.dart';
import '../../../../../../core/utils/app_colors.dart';
import 'cubit/tracker_cubit.dart';
import 'cubit/tracker_states.dart';

class Document extends StatelessWidget {
  const Document({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>TrackerCubit()..getAllMedicalDocument(),
      child: BlocConsumer<TrackerCubit, TrackerStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit = TrackerCubit.get(context);
          bool noData=false;
          return Column(
            children: [

              ConditionalBuilder(
                builder: (context) {
                  if(cubit.getAllMedicalDocumentModel!.medicalDocument!.isNotEmpty)noData=true;
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
                  return noData? ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          documentCard(documentURL: "${cubit.getAllMedicalDocumentModel!.medicalDocument![index].document}"),
                      separatorBuilder: (context, index) => Container(
                    height: 16.0,
                  ) , itemCount: cubit.getAllMedicalDocumentModel!.medicalDocument!.length):const Center(child: Text("No Data set yet"));
                },condition:  (state is! AllActivityLoadingState),
                fallback:(context)=> const Center(child: CircularProgressIndicator()),
              ),
              const SizedBox(height: 20.0),
              const Icon(Icons.drive_folder_upload,size: 50,color: AppColors.green,),
              addButton(context: context,
                text: "Upload Document",
                color:AppColors.lightGreen,
                textcolor: AppColors.green,
                addPhoto: (){
                cubit.addImage();
                },

              ),
            ],
          );
        },
      ),
    );
  }
  Widget documentCard({required String documentURL}){
  return InkWell(
    onTap: (){},
    child: Padding(
      padding: const EdgeInsets.only(right: 20.0,left: 20),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          border: Border.all(
            color: Colors.white,
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 1),
              // blurRadius: 4,
              // spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 40.0,
              width: 40,
              child:
              Image.network(documentURL,
                fit: BoxFit.cover,),
            ),
            const SizedBox(width: 10.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Bloody picture analysis" ,style: GoogleFonts.poppins(
                    color: AppColors.green,
                    fontSize: 14.0
                ),),
                Text("23 may",style: GoogleFonts.poppins(
                    color: Colors.green,
                    fontSize: 10.0
                ),),
              ],
            ),
            const Spacer(),
            Text("23 may",style: GoogleFonts.poppins(
                color: Colors.green,
                fontSize: 10.0
            ),),
          ],
        ),
      ),
    ),
  );
  }
}
