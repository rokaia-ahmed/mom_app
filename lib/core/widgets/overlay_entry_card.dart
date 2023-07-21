import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/widgets/custom_icon_button.dart';

import '../utils/app_colors.dart';
import 'add_button.dart';
OverlayEntry? overlayEntry;
OverlayEntry? overlayEntryCard({ required BuildContext context, color, isIcon1,isIcon2,isIcon3,
  required String cardText,required String text1,required String text2,required String text3}){
  overlayEntry=OverlayEntry(
    builder: (BuildContext context) {
      return Positioned(
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
                          dispose();
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
                        ElevatedButton(onPressed: (){
                          dispose();
                        },child:Text("save",style: GoogleFonts.poppins(
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
                  textField(  text: text1,color: color, isIcon: isIcon1),

                  //separete line
                  // Container(
                  //   height: 1.0,
                  //   width: double.infinity,
                  //   color: Colors.grey.shade100,
                  // ),
                  textField(  text: text2,color: color, isIcon: isIcon2),
                  Container(
                    height: 1.0,
                    width: double.infinity,
                    color: Colors.grey.shade100,
                  ),
                  textField(  text:text3,color: color, isIcon: isIcon3),
                  //separete line
                  Container(
                    height: 1.0,
                    width: double.infinity,
                    color: Colors.grey.shade100,
                  ),
                  //button add photo
                  addButton(context: context,text: "Add photo",color: color),

                ],
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

Widget textField({required String text,required color,isIcon,}){
  return  Container(
    width: double.infinity,
    color: Colors.white,
    padding: EdgeInsets.only(right: 20,left: 20),
    child:  Material(
      color: Colors.white,
      child: TextFormField(
        style:TextStyle(
          color: AppColors.green,
        ) ,
        cursorColor: color,
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
           suffixIcon: isIcon

        ),

      ),
    ),
  );
}
void dispose() {
  // Remove the overlay entry when the widget is disposed.
  overlayEntry?.remove();
  // super.dispose();
}