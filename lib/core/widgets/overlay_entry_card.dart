import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mom_app/core/utils/media_query_values.dart';

import '../utils/app_colors.dart';
import 'add_button.dart';
OverlayEntry? overlayEntry;
OverlayEntry? overlayEntryCard({ required BuildContext context, color}){
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
                    height: context.height*0.3,
                  ),
                  //bar design
                  Container(
                    // height: 100.0,
                    width: double.infinity,
                    color: color,
                    padding: EdgeInsets.all(10.0),
                    child:  Row(
                      children: [
                        //close
                        TextButton(onPressed: (){
                          dispose();
                        }, child: Icon(Icons.close_outlined,color: AppColors.green,)),
                        const Text("New reminder",style: TextStyle(
                          fontSize: 16,
                          color: AppColors.green,
                          decoration: TextDecoration.none, // remove the underline here
                        ),),
                        Spacer(),
                        //save
                        TextButton(onPressed: (){
                          dispose();
                        }, child:const Text("Save" ,style: TextStyle(
                          fontSize: 12,
                          color: AppColors.green,
                          decoration: TextDecoration.none, // remove the underline here
                        ) ),)
                      ],
                    ),
                  ),
                  textField(  text: "Reminder time"),

                  //separete line
                  Container(
                    height: 1.0,
                    width: double.infinity,
                    color: Colors.grey.shade100,
                  ),
                  textField(  text: "Medication"),
                  Container(
                    height: 1.0,
                    width: double.infinity,
                    color: Colors.grey.shade100,
                  ),
                  textField(  text: "Note"),
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

Widget textField({required String text}){
  return  Container(
    width: double.infinity,
    color: Colors.white,
    padding: EdgeInsets.only(right: 20,left: 20),
    child:  Material(
      color: Colors.white,
      child: TextFormField(
        textAlign: TextAlign.left,
        decoration:  InputDecoration(
          focusColor: Colors.white,
          prefixIcon: Padding(
            padding:  EdgeInsets.only(top: 8.0,bottom: 8.0,left: 8.0,right: 30.0),
            child: Text(text,style: TextStyle(
                fontSize: 14,
                color: AppColors.green,
                decoration: TextDecoration.none
            ) ,),
          ),

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