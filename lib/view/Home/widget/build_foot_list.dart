import 'package:flutter/material.dart';
import 'package:mom_app/core/utils/media_query_values.dart';

class BuildFootList extends StatelessWidget {
   BuildFootList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:context.height*0.15,
      child: ListView.separated(
          shrinkWrap:true ,
          scrollDirection:Axis.horizontal ,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context,index){

          return  buildItem(context,index);
          },
          separatorBuilder:(context,index)=>
           const SizedBox(
            width: 10,
          ),
          itemCount: 3,
      ),
    );
  }
final  List<Color> colors=
    [
    const Color(0xffFDF5E5),
    const Color(0xffDAEAE3),
    const Color(0xffE6FFE2),
    ];

 Widget buildItem(BuildContext context,int index){
   return Container(
     width:context.width*0.3,
     padding:const EdgeInsets.all(10) ,
     decoration:BoxDecoration(
       color: colors[index] ,
       borderRadius: BorderRadius.circular(8),
     ) ,
     child:Column(
       children: [
         Image.asset('assets/images/apple.png',
          height:context.height*0.08 ,
           width: context.width*0.13,
         ),
          SizedBox(
           height: context.height*0.01 ,
         ),
         const Text('Sweet potato'),
       ],
     ) ,
   );
  }
}
