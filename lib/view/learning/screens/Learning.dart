import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/widgets/app_bar.dart';
import 'package:mom_app/core/widgets/custom_icon_button.dart';
import 'package:mom_app/view/layout/layout_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import 'learning_data.dart';

var searchController = TextEditingController();

class Learning extends StatelessWidget {
  Learning({super.key});

  void launchURL(String url) async {
    Uri uRl = Uri.parse(url);
    if (!await launchUrl(uRl, mode: LaunchMode.externalApplication)) {
      throw ' can\'t launch the URL.$uRl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(
          context: context, title: "Learning", screen: LayoutScreen()),
      body: Column(
        children: [
          const SizedBox(
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
                    controller: searchController,
                    backGroundColor: Colors.grey.shade200,
                    height: 30,
                    visible: false,
                    suffixIcon: Icon(
                      Icons.search_outlined,
                      color: AppColors.green,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                customIconButton(
                    onTap: () {},
                    isIcon: true,
                    icon: Icons.favorite_border_outlined,
                    color: Colors.green),
              ],
            ),
          ),
          //separated line
          Container(
            color: Colors.grey.shade200,
            height: 1.0,
          ),
          const SizedBox(
            height: 10.0,
          ),
          //grid view
          Expanded(
            child: GridView.count(
                padding: EdgeInsets.all(20),
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.07 / 1.25,
                crossAxisCount: 2,
                children: List.generate(
                    Data.name.length,
                    (index) => buildGridViewLearningList(
                        Data.name, Data.images, Data.video, index))),
          )
        ],
      ),
    );
  }

  Widget buildGridViewLearningList(
      List name, List image, List video, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.greenAccent.shade100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            child: InkWell(
              onTap: () {
                launchURL(video[index]);
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image(
                    width: double.infinity,
                    height: 120,
                    errorBuilder: (context,_,error){
                      return Container();
                    },
                    image: NetworkImage(
                      image[index],
                    ),
                    fit: BoxFit.cover,
                  ),
                  Image.asset('assets/images/play.png',
                   width: 30,
                   height: 30,
                    color:Colors.white.withOpacity(0.7) ,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    name[index],
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.poppins(
                      color: AppColors.green,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                customIconButton(
                    onTap: () {},
                    isIcon: true,
                    icon: Icons.favorite,
                    color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
