import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/core/utils/media_query_values.dart';
import 'package:mom_app/core/utils/navigator.dart';
import 'package:mom_app/core/widgets/custom_button.dart';
import 'package:mom_app/view/Baby_Info/screens/baby_profile_screen.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: context.height*0.04,
                ),
                Center(
                     child: Column(
                       children: [
                         Text('Welcome to parent’s'
                             .toUpperCase(),
                            textAlign:TextAlign.center ,
                         style:const TextStyle(
                           color:Colors.white ,
                           fontSize:20,
                           fontWeight:FontWeight.w400,
                         ) ,
                         ),
                         Text('world!!'
                             .toUpperCase(),
                           textAlign:TextAlign.center ,
                           style:const TextStyle(
                             color:Colors.white ,
                             fontSize:20,
                             fontWeight:FontWeight.w400,
                           ) ,
                         ),
                         Text('let’s create a profile for'
                             .toUpperCase(),
                           textAlign:TextAlign.center ,
                           style:const TextStyle(
                             color:Colors.white ,
                             fontSize:20,
                             fontWeight:FontWeight.w400,
                           ) ,
                         ),
                         Text('your baby'
                             .toUpperCase(),
                           textAlign:TextAlign.center ,
                           style:const TextStyle(
                             color:Colors.white ,
                             fontSize:20,
                             fontWeight:FontWeight.w400,
                           ) ,
                         ),
                       ],
                     ),
                   ),
                Image.asset('assets/images/baby.png'),
                CustomButton(
                  onTap:(){
                    AppNavigator.push(context: context,
                        screen:  BabyProfileScreen(),
                    );
                  },
                  child:Center(
                    child: Text('Add My Baby',
                     style:GoogleFonts.poppins(
                       fontSize: 16,
                     ) ,
                    ),
                  ) ,
                ),
              ],
            ),
          ),
        ),
      ) ,
    );

  }
}
