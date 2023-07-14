import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/navigator.dart';
import '../home_screen.dart';

class Reminder extends StatelessWidget {
  const Reminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        title: const Center(
          child: Text("Reminder",style: TextStyle(

          ),),
        ),
        leading: IconButton( onPressed: () {
          Navigator.pop(context);
        },
            icon:Icon( Icons.arrow_back_ios)),
      ),
    );
  }
}
