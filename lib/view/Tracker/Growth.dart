import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/models/all_Growth_model.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import '../../../../../core/models/all_Meals_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../../../../core/widgets/custom_icon_button.dart';
import '../../../../../core/widgets/overlay_entry_card.dart';
import '../../../../../core/widgets/top_screen_color_line.dart';
import 'baby_tracker_deafult_screens.dart';
import 'healthscreens/cubit/tracker_cubit.dart';
import 'healthscreens/cubit/tracker_states.dart';
var x=0;
class Growth extends StatelessWidget {
  Growth ({super.key});
  var dateController=TextEditingController();
  var heightController=TextEditingController();
  var weightController=TextEditingController();
  final color=AppColors.lightblue;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>TrackerCubit()..getAllGrowth(),
      child: BlocConsumer<TrackerCubit, TrackerStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = TrackerCubit.get(context);
          final formKey = GlobalKey<FormState>();
          return Scaffold(
              appBar: defaultAppBar(context: context,title: "Growth"),
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
                                // print(cubit.getAllGrowthModel!.growthList!.length.toString());
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
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder:(context, index) =>  CardList(color: color,
                                        context: context,
                                        icon: Icons.sports_baseball,
                                        title: "Feed",
                                        image: false,
                                        index: index,
                                        model: cubit.getAllGrowthModel,
                                        formKey: formKey,
                                        updateOnTap: () {
                                          heightController.text = cubit.getAllGrowthModel!.growthMilestones![index].height.toString();
                                          weightController.text = cubit.getAllGrowthModel!.growthMilestones![index].weight.toString();
                                          dateController.text = cubit.getAllGrowthModel!.growthMilestones![index].date.toString();
                                          over(context, cubit, formKey, index);
                                        },
                                        deleteOnTap: (){
                                          cubit.deleteGrowth(id: cubit.getAllGrowthModel!.growthMilestones![index].id);
                                          print("deleted");
                                        },
                                    ),
                                    separatorBuilder:(context, index) => Container(
                                      height: 20.0,
                                      color: Colors.white,
                                    ), itemCount:cubit.getAllGrowthModel!.growthMilestones!.length);
                              }, condition: (state is! AllActivityLoadingState),
                              fallback:(context)=> const Center(child: CircularProgressIndicator())),
                        ),
                        SizedBox(height: 10.0,),
                        Center(
                          child: InkWell(
                            onTap:(){
                              heightController.clear();
                              weightController.clear();
                              // dateController.text=currentTime;
                              saveOverlay(context, cubit, formKey);
                              heightController.clear();
                              weightController.clear();
                              dateController.clear();
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
    // return activityScreen.babyTrackerDefaultScreens();
  }
  Widget CardList({required color,
    required icon,
    required String title,
    required bool image,
    TrackerCubit? cubit,
    required updateOnTap,
    required index,
    required GetAllGrowthModel? model,
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
          image? Image.network("https://th.bing.com/th/id/R.8e220cdb5a70a3c9376685d35509a7e0?rik=9INY0TSzHLNjOw&pid=ImgRaw&r=0",
            width: double.infinity,
            height:context.height*0.25,
            fit: BoxFit.cover,
          ): const SizedBox(height: 0.0,),
          const SizedBox(height: 10.0,),
          Row(
            children: [
              Text("Date: ",style: GoogleFonts.poppins(
                // color: AppColors.green,
                fontSize: 12.0,
              ),
                // maxLines: 2,
                // overflow: TextOverflow.ellipsis,
              ),
              Text("${cubit?.getAllGrowthModel?.growthMilestones![index].date}",style: GoogleFonts.poppins(
                color: AppColors.green,
                fontSize: 12.0,
              ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Text("Age: ",style:GoogleFonts.poppins(
                // color: Colors.black54,
                fontSize: 12.0,
              ) ,),
              Text("6 months",style:GoogleFonts.poppins(
                color: AppColors.green,
                fontSize: 12.0,
              ) ,)
            ],
          ),
          const SizedBox(height: 10.0,),
          Row(
            children: [
              Text("Height: ",style: GoogleFonts.poppins(
                // color: AppColors.green,
                fontSize: 12.0,
              ),
                // maxLines: 2,
                // overflow: TextOverflow.ellipsis,
              ),
              Text("${cubit?.getAllGrowthModel?.growthMilestones![index].height}",style: GoogleFonts.poppins(
                color: AppColors.green,
                fontSize: 12.0,
              ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Text("Weight: ",style: GoogleFonts.poppins(
                // color: AppColors.green,
                fontSize: 12.0,
              ),
                // maxLines: 2,
                // overflow: TextOverflow.ellipsis,
              ),
              Text("${cubit?.getAllGrowthModel?.growthMilestones![index].weight}",style: GoogleFonts.poppins(
                color: AppColors.green,
                fontSize: 12.0,
              ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Center(child: customIconButton(onTap:deleteOnTap , isIcon: false,text: "delete"))
        ],
      ),
    );
  }
  Widget wightAndHeight(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 20,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.tealAccent,
            borderRadius: BorderRadius.circular(5)
        ),
        padding: EdgeInsets.all(2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text(" ${x}")),
            // Spacer(),
            SizedBox(width: 10,),
            Spacer(),
            Column(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      x=x+1;
                      print(x);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:BorderRadius.only(
                            topRight: Radius.circular(5)
                        ) ,
                      ),
                      child: Icon(Icons.arrow_drop_up_outlined,color: AppColors.green,size: 12),
                    ),
                  ),
                ),
                SizedBox(height: 1,),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      x=x+1;
                      print(x);
                    },
                    child: Container(

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:BorderRadius.only(
                            bottomRight: Radius.circular(5)
                        ) ,
                      ),
                      child: Icon(Icons.arrow_drop_down_outlined,color: AppColors.green,size: 12),
                    ),
                  ),
                ),
                // Expanded(child: IconButton(onPressed: (){}, icon:Icon( Icons.arrow_drop_down_outlined),iconSize: 3,))
              ],
            )
          ],
        ),
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
      });
    }
  }
  OverlayEntry over(BuildContext context,cubit,formKey,index){
    return    overlayEntryCard(context: context,
        cardText:"Growth",
        text1: "Date",
        text2: "Height",
        text3: "Weight",
        color: color,
        formKey: formKey,
        controller1: dateController,
        controller2: heightController,
        controller3: weightController,
        icon1:customIconButton(onTap: (){
          disposeOverlay();
          selectDate(context, cubit, formKey,index: index);
          // if(startTimeController.text!=cubit.getAllActivityModel?.activities?[index].time.toString())startTimeController.text=selectedTime.toString();
        }, isIcon: true,icon:Icons.date_range_outlined ),
        saveOnPressed:(){
          if(formKey.currentState!.validate()){
            cubit.updateGrowth(id:cubit.getAllGrowthModel!.growthList![index].id.toString(),
                weight: '${weightController.text}', height: '${heightController.text}', date: ('${cubit.getAllGrowthModel!.growthList![index].date}'));

          }})!;
  }
  OverlayEntry saveOverlay(BuildContext context,cubit, formKey){

    return     overlayEntryCard(context: context,
        color:color,
        icon1:customIconButton(onTap: (){
          disposeOverlay();
          selectDate(context, cubit, formKey);
        }, isIcon: true,icon:Icons.date_range_outlined ),
        cardText:"Growth",
        text1: "Date",
        text2: "Height",
        text3: "Weight",
        controller1:dateController,
        controller2: heightController,
        controller3: weightController,
        formKey: formKey,
        addPhoto: (){
          // cubit.addImage();
        },
        saveOnPressed: (){
          if(formKey.currentState!.validate()){
            // final formattedDate = DateFormat('yyyy-M-d').format(DateTime.now());
            cubit.addGrowth(date: dateController.text, height: heightController.text, weight: weightController.text);
          }})!;
  }
}