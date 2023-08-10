import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/view/Home/screens/bottomNavBarScreens/babyTrackerSreens/healthscreens/cubit/tracker_cubit.dart';
import 'package:mom_app/view/Home/screens/bottomNavBarScreens/babyTrackerSreens/healthscreens/cubit/tracker_states.dart';

import '../../../../../core/models/all_reminder_model.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../../../../core/widgets/custom_icon_button.dart';
import '../../../../../core/widgets/overlay_entry_card.dart';
import '../../../../../core/widgets/top_screen_color_line.dart';
var startTimeController=TextEditingController();
// var activityController=TextEditingController();
var noteController=TextEditingController();

class Reminder extends StatelessWidget {
  Reminder({super.key});
  final color =AppColors.lightblue;
  late TimeOfDay selectedTime;
  var currentTime;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>TrackerCubit()..getAllReminder(),
      child: BlocConsumer<TrackerCubit, TrackerStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit = TrackerCubit.get(context);
          final formKey = GlobalKey<FormState>();
          return Scaffold(
              appBar: defaultAppBar(context: context,title: "Reminder"),
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
                                print(cubit.getAllReminderModel!.reminders!.length);
                                return ListView.separated(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder:(context, index) =>  CardList(color: color,
                                        context: context,
                                        icon: Icons.sports_baseball,
                                        title: "${cubit.getAllReminderModel!.reminders?[index].time}",
                                        image: false,
                                        index: index,
                                        model: cubit.getAllReminderModel,
                                        formKey: formKey,
                                        updateOnTap: () {
                                          // activityController.text = cubit.getAllActivityModel!.activities![index].activity.toString();
                                          noteController.text = cubit.getAllReminderModel!.reminders![index].note.toString();
                                          startTimeController.text = cubit.getAllReminderModel!.reminders![index].time.toString();
                                          selectedTime = TimeOfDay.fromDateTime(DateTime.now());//TimeOfDay.now();
                                          over(context, cubit, formKey, index);

                                        },
                                        deleteOnTap: (){
                                          cubit.deleteReminder(id: cubit.getAllReminderModel!.reminders?[index].id);
                                          print("deleted");
                                        }
                                    ),
                                    separatorBuilder:(context, index) => Container(
                                      height: 20.0,
                                      color: Colors.white,
                                    ), itemCount:cubit.getAllReminderModel!.reminders!.length);
                              }, condition: (state is! AllActivityLoadingState),
                              fallback:(context)=> const Center(child: CircularProgressIndicator())),
                        ),
                        SizedBox(height: 10.0,),
                        Center(
                          child: InkWell(
                            onTap:(){
                              selectedTime = TimeOfDay.fromDateTime(DateTime.now());//TimeOfDay.now();
                              noteController.clear();
                              startTimeController.text=currentTime;
                              saveOverlay(context, cubit, formKey);
                              // activityController.clear();
                              noteController.clear();
                              startTimeController.clear();
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
    required GetAllReminderModel? model,
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
          image? Image.network("https://th.bing.com/th/id/R.8e220cdb5a70a3c9376685d35509a7e0?rik=9INY0TSzHLNjOw&pid=ImgRaw&r=0",
            width: double.infinity,
            height:context.height*0.25,
            fit: BoxFit.cover,
          ): const SizedBox(height: 0.0,),
          const SizedBox(height: 10.0,),
          Text("${model!.reminders?[index].note}",style:GoogleFonts.poppins(
            color: AppColors.green,
            fontSize: 12.0,
          ) ,),
          SizedBox(height: 10,),
          Center(child: customIconButton(onTap:deleteOnTap , isIcon: false,text: "delete"))
        ],
      ),
    );
  }
  Future<void> selectTime(BuildContext context, TrackerCubit cubit, GlobalKey<FormState> formKey, {int? index}) async {

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,

      // firstDate: TimeOfDay.now(),
    );
    print("$selectedTime + $pickedTime");
    if (pickedTime!.hour > selectedTime.hour || (pickedTime.hour == selectedTime.hour && pickedTime.minute > selectedTime.minute)) {
      // Invalid time selected
      // Show an error message or handle it accordingly
      // For example, you can display a snackbar indicating that the selected time should not be greater than the current time
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(duration: Duration(seconds: 3),backgroundColor: color,content: Text(
            "Please select a time not greater than the current time")),

      );
    }
    if (pickedTime != selectedTime) {
      selectedTime = pickedTime;
    }
    String min=selectedTime.minute.toString();
    if(selectedTime.minute<10)
      min="0${selectedTime.minute}";
    if(selectedTime.hour>12) {

      currentTime="${selectedTime.hour-12}:${min} pm";
    } else {
      currentTime="${selectedTime.hour}:${min} am";
    }
    if(index!=null) {//update
      over(context, cubit, formKey, index);
    } else {//add activity
      saveOverlay(context, cubit, formKey);
      startTimeController.text=currentTime;
    }
    print('currentTime= $currentTime');
  }
  OverlayEntry over(BuildContext context,cubit,formKey,index){
    return    overlayEntryCard(context: context,
        cardText:"Reminder",
        text1: "Reminder time",
        text2: "Medication",
        text3: "note",
        color: color,
        formKey: formKey,
        controller1: startTimeController,
        // controller2: activityController,
        controller3: noteController,
        icon1:customIconButton(onTap: (){
          disposeOverlay();
          selectTime(context, cubit, formKey,index: index);
          // if(startTimeController.text!=cubit.getAllActivityModel?.activities?[index].time.toString())startTimeController.text=selectedTime.toString();
        }, isIcon: true,icon:Icons.date_range_outlined ),
        saveOnPressed:(){
          if(formKey.currentState!.validate()){
            cubit.updateReminder(id:cubit.getAllReminderModel.reminders[index].id.toString(),
               time: '${startTimeController.text}', note: '${noteController.text}', date: ('${cubit.getAllReminderModel?.reminders?[index].date.toString()}'));

          }})!;
  }
  OverlayEntry saveOverlay(BuildContext context,cubit, formKey){

    return     overlayEntryCard(context: context,
        color:color,
        icon1:customIconButton(onTap: (){
          disposeOverlay();
          selectTime(context, cubit, formKey);
        }, isIcon: true,icon:Icons.date_range_outlined ),
        cardText: 'Reminder', text1: 'Reminder time', text2: 'Medication', text3: 'note',controller1:startTimeController,
        controller3: noteController,formKey: formKey,
        saveOnPressed: (){
          if(formKey.currentState!.validate()){
            final formattedDate = DateFormat('yyyy-M-d').format(DateTime.now());
            cubit.addReminder(time: startTimeController.text, note: noteController.text, date: "${formattedDate}");
          }})!;
  }
}