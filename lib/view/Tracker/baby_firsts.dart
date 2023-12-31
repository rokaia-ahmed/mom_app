import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/utils/navigator.dart';

import '../../../../../core/models/all_baby_first_model.dart';
import '../../../../../core/models/all_reminder_model.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../../../../core/widgets/custom_icon_button.dart';
import '../../../../../core/widgets/open_image.dart';
import '../../../../../core/widgets/overlay_entry_card.dart';
import '../../../../../core/widgets/top_screen_color_line.dart';
import 'healthscreens/cubit/tracker_cubit.dart';
import 'healthscreens/cubit/tracker_states.dart';
var dateController=TextEditingController();
var firstController=TextEditingController();
var noteController=TextEditingController();

class BabyFirsts extends StatelessWidget {
  BabyFirsts({super.key});
  String? imageURL;
  final color =AppColors.lightRed;
  late TimeOfDay selectedTime;
  var currentTime;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>TrackerCubit()..getAllBabyFirst(),
      child: BlocConsumer<TrackerCubit, TrackerStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit = TrackerCubit.get(context);
          final formKey = GlobalKey<FormState>();
          return Scaffold(
              appBar: defaultAppBar(context: context,title: "Baby Firsts"),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                      children: [
                        //top screen color
                        topScreenColorLine(color:color),
                        SizedBox(
                          height: context.height*0.05,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child:ConditionalBuilder(
                              builder: (context) {
                                // print("${cubit?.getAllBabyFirstModel?.firsts?[0].image}");
                                // print(cubit.getAllBabyFirstModel!.firsts!.length);
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
                                return ListView.separated(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder:(context, index) =>  CardList(color: color,
                                        context: context,
                                        icon: Icons.sports_baseball,
                                        title: "Home",
                                        image: true,
                                        index: index,
                                        model: cubit.getAllBabyFirstModel,
                                        formKey: formKey,
                                        updateOnTap: () {
                                          firstController.text =cubit.getAllBabyFirstModel!.firsts![index].babyFirst.toString();
                                          noteController.text =cubit.getAllBabyFirstModel!.firsts![index].note.toString();
                                          dateController.text = cubit.getAllBabyFirstModel!.firsts![index].date.toString();
                                          // imageURL=cubit.getAllBabyFirstModel!.firsts![index].image.toString();
                                          // print(imageURL);
                                          selectedTime = TimeOfDay.fromDateTime(DateTime.now());//TimeOfDay.now();
                                          over(context, cubit, formKey, index);
                                        },
                                        deleteOnTap: (){
                                          cubit.deleteBabyFirst(id: cubit.getAllBabyFirstModel!.firsts![index].id);
                                          print("deleted");
                                        }
                                    ),
                                    separatorBuilder:(context, index) => Container(
                                      height: 20.0,
                                      color: Colors.white,
                                    ), itemCount:cubit.getAllBabyFirstModel!.firsts!.length);
                              }, condition: (state is! AllActivityLoadingState),
                              fallback:(context)=> const Center(child: CircularProgressIndicator())),
                        ),
                        SizedBox(height: 10.0,),
                        Center(
                          child: InkWell(
                            onTap:(){
                              selectedTime = TimeOfDay.fromDateTime(DateTime.now());//TimeOfDay.now();
                              noteController.clear();
                              dateController.clear();
                              firstController.clear();
                              imageURL="";
                              saveOverlay(context, cubit, formKey);
                              noteController.clear();
                              dateController.clear();
                              firstController.clear();
                            },
                            child: Icon(Icons.add_circle,size: 40.0,color: color,),
                          ),
                        ),
                      ]
                  )
              ));


        },
      ),
    );
  }
  Widget CardList({required color,
    required icon,
    required String title,
    required bool image,
    TrackerCubit? cubit,
    required updateOnTap,
    required index,
    required GetAllBabyFirstModel? model,
    required BuildContext context,
    required deleteOnTap,
    formKey}){
    return Container(
      width: double.infinity,
      padding:EdgeInsets.all(10.0),
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: color, // set the color of the border here
          width: 1, // set the width of the border here
        ),
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15.0,
                backgroundColor: color,
                child: Center(child: Icon(icon,size: 30.0,color: Colors.black,)),
              ),
              const SizedBox(width: 10.0,),
              Text(title,style: GoogleFonts.poppins(
                  color: AppColors.green,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
              )),
              const Spacer(),
              //update
              customIconButton(isIcon: true,icon: Icons.create_outlined,onTap:updateOnTap,
              ),
            ],
          ),
          const SizedBox(height: 10.0,),
          image? InkWell(
            onTap: (){
              AppNavigator.push(context: context, screen:OpenFullImage(url: "${model!.firsts?[index].image}",));
            },
            child: Image.network("${model!.firsts?[index].image}",
              width: double.infinity,
              height:context.height*0.25,
              fit: BoxFit.cover,
            ),
          ): const SizedBox(height: 0.0,),
          const SizedBox(height: 10.0,),
          Text("${model!.firsts ?[index].babyFirst}",style:GoogleFonts.poppins(
            color: AppColors.green,
            fontSize: 12.0,
          ) ,),
          SizedBox(height: 10,),
          Center(child: customIconButton(onTap:deleteOnTap , isIcon: false,text: "delete"))
        ],
      ),
    );
  }
  Future<void> selectDate(BuildContext context, TrackerCubit cubit, GlobalKey<FormState> formKey, {int? index}) async {
    {
      showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2025),
      ).then((value){
        if(value !=null){
          dateController.text = formatDate(value, [yyyy, '-', mm, '-', dd]);
          print(formatDate(value, [yyyy, '-', mm, '-', dd]));
        }else {
          dateController.text ='0000-00-00';
        }
        if(index==null) saveOverlay(context, cubit, formKey);
        else over(context, cubit, formKey, index);
      });
    }
  }
  OverlayEntry over(BuildContext context,cubit,formKey,index){
    return    overlayEntryCard(context: context,
        cardText:"Baby First",
        text1: "Date",
        text2: "Baby first",
        text3: "note",
        color: color,
        formKey: formKey,
        controller1: dateController,
        controller2: firstController,
        controller3: noteController,
        addPhoto: (){
      cubit.addPureImage();
      if(cubit.image!=null)imageURL=cubit.image.path;
      // print(imageURL);
        },
        icon1:customIconButton(onTap: (){
          disposeOverlay();
          selectDate(context, cubit, formKey,index: index);
          // if(startTimeController.text!=cubit.getAllActivityModel?.activities?[index].time.toString())startTimeController.text=selectedTime.toString();
        }, isIcon: true,icon:Icons.date_range_outlined ),
        saveOnPressed:(){
          if(formKey.currentState!.validate()){
            if(imageURL!=null||imageURL!=""){
              cubit.updateBabyFirst(id:cubit.getAllBabyFirstModel.firsts[index].id.toString(),
                date: dateController.text,
                note: noteController.text,
                babyFirst: firstController.text,
                image:imageURL,);
            }
            else {
              cubit.updateBabyFirst(id:cubit.getAllBabyFirstModel.firsts[index].id.toString(),
                date: dateController.text,
                note: noteController.text,
              babyFirst: firstController.text,);
            }
          }})!;
  }
  OverlayEntry saveOverlay(BuildContext context,cubit, formKey){

    return     overlayEntryCard(context: context,
        color:color,
        icon1:customIconButton(onTap: (){
          disposeOverlay();
          selectDate(context, cubit, formKey);
        }, isIcon: true,icon:Icons.date_range_outlined ),
        cardText: 'Home', text1: 'Date', text2: 'Baby First', text3: 'note',controller1:dateController,controller2: firstController,
        controller3: noteController,formKey: formKey,
        addPhoto: (){
          cubit.addPureImage();
        },
        saveOnPressed: (){
          if(formKey.currentState!.validate()){
            final formattedDate = DateFormat('yyyy-M-d').format(DateTime.now());
            cubit.addBabyFirst(date: dateController.text, note: noteController.text, babyFirst: firstController.text,image:cubit.image.path);
          }})!;
  }
}