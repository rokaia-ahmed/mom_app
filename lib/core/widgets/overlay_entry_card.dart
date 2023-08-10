import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/widgets/custom_icon_button.dart';

import '../utils/app_colors.dart';
import 'add_button.dart';
OverlayEntry? overlayEntry;
OverlayEntry? overlayEntryCard({ required BuildContext context,required Color color, icon1,icon2,icon3,
  required String cardText,required String text1,required String text2,required String text3,formKey,
   controller1,  controller2, controller3,addPhoto,
  saveOnPressed}){
  overlayEntry=OverlayEntry(
    builder: (BuildContext context) {
      return Form(
        key: formKey,
        child: Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            color: Colors.black.withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: context.height*0.25,
                    ),
                    //bar design
                    Container(
                      // height: 100.0,
                      width: double.infinity,
                      color: color,
                      // padding: EdgeInsets.all(10.0),
                      child:  Row(
                        children: [
                          //close
                          ElevatedButton(onPressed: (){
                            disposeOverlay();
                          },child:Icon(Icons.close_outlined,color: AppColors.green,) ,style: ElevatedButton.styleFrom(
                        primary: color, // custom button color
                        onPrimary: color, // text color
                        elevation: 0.0),
                          ),

                           Text(cardText,style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.green,
                            decoration: TextDecoration.none, // remove the underline here
                          ),),
                          Spacer(),
                          //save
                          ElevatedButton(onPressed: saveOnPressed,child:Text("save",style: GoogleFonts.poppins(
                            fontSize: 12.0,
                            color: AppColors.green
                          ),) ,style: ElevatedButton.styleFrom(
                              primary: color, // custom button color
                              onPrimary: color, // text color
                              elevation: 0.0),
                          ),
                        ],
                      ),
                    ),
                    textField(  text: text1,color: color, icon: icon1,controller: controller1),
                    textField(  text: text2,color: color, icon: icon2,controller: controller2),
                    textField(  text:text3,color: color, icon: icon3,controller: controller3),
                    //separete line
                    //button add photo
                    addButton(context: context,text: "Add photo",color: color,addPhoto: addPhoto),

                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
  // Add the overlay entry to the overlay.
  Overlay.of(context).insert(overlayEntry!);
  return overlayEntry ;
}

Widget textField({required String text,required color,icon,required controller,String? initialValue}){
  return  Container(
    width: double.infinity,
    color: Colors.white,
    padding: EdgeInsets.only(right: 20,left: 20),
    child:  Material(
      color: Colors.white,
      child: TextFormField(
        validator: (value){
  if (value == null || value.isEmpty) {
  return 'this field must not be empty';
  }
  return null;
        },
        style:const TextStyle(
          color: AppColors.green,
        ) ,
        controller: controller,
        cursorColor: color,
        // initialValue:initialValue ,

        textAlign: TextAlign.left,
        decoration:  InputDecoration(
          focusColor: Colors.white,
          prefixIcon: Padding(
            padding:  EdgeInsets.only(top: 15.0,left: 8.0,right: 50),
            child: Text(text,style: const TextStyle(
                fontSize: 14,
                color: AppColors.green,
                decoration: TextDecoration.none
            ) ,),
          ),
           suffixIcon: icon

        ),

      ),
    ),
  );
}
void disposeOverlay() {
  // Remove the overlay entry when the widget is disposed.
  overlayEntry?.remove();
  // super.dispose();
}