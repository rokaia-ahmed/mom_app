import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mom_app/core/utils/media_query_values.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/widgets/app_bar.dart';
import '../../../../../../core/widgets/top_screen_color_line.dart';

class VaccineLocation extends StatelessWidget {
  const VaccineLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: defaultAppBar(context: context,title: "Vaccine Locations"),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // scrollDirection: Axis.vertical,
                children: [
                  SizedBox(
                    height: context.height*0.02,
                  ),
                  //top screen color
                  topScreenColorLine(color: AppColors.lightGreen),
                  SizedBox(
                    height:10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20,),
                    child: Text("Vaccine Name"),
                  ),
                  // SizedBox(
                  //   height:10.0,
                  // ),
            // Stack(
            //   children: <Widget>[
            //     GoogleMap(
            //       initialCameraPosition: CameraPosition(
            //         target: LatLng(37.7749, -122.4194), // San Francisco, CA
            //         zoom: 12,
            //
            //       ),
            //     ),
            //   ],
            // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20,),
                    child: Image(image: AssetImage("assets/images/location.png",),width: double.infinity,height: 250,),
                  ),
                ])));
  }
}
