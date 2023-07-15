
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/navigator.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../layout/layout_screen.dart';
import 'community/community.dart';


class Learning extends StatelessWidget {
   Learning({super.key});
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        title: const Center(
          child: Text("Learning",style: TextStyle(

          ),),
        ),
        leading: IconButton( onPressed: () {
          AppNavigator.push(context: context,
            screen:  const LayoutScreen(),
          );
        },
            icon:Icon( Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          //search and love icon
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    hintText: 'Search...',
                    controller: searchcontroller,
                    //backgroundcolor: Colors.grey.shade200,
                    height: 40,
                    visible: false,
                    suffixIcon:Icon(Icons.search_outlined,color: AppColors.green,) ,
                  ),
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined,color: Colors.green,))

              ],
            ),
          ),
       //separated line
          Container(
            color: Colors.grey.shade200,
            height: 1.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: GridView.count(
            padding:EdgeInsets.all(20) ,
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.08/1,
                crossAxisCount: 2,children:List.generate(10, (index) => buildGridViewLernningList()
            )
            ),
          )

        ],
      ),
    );
  }
  Widget buildGridViewLernningList(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.greenAccent.shade200,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            child: Image(
              width: double.infinity,
              image: NetworkImage('https://th.bing.com/th/id/OIP.2_wYPt9NQjmLngMPv9WXuQHaE8?w=270&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
              // width: double.infinity,
              // height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Baby language",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GoogleFonts.poppins(
                    color: AppColors.green,
                  ),
                ),
                Spacer(),
                IconButton(onPressed: (){}, icon: Icon(Icons.favorite,
                  color: Colors.white,
                ))
              ],
            ),
          ),

        ],
      ),
    );

  }
}
