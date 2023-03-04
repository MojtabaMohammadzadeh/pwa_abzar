


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../category/presentation/single_places_page.dart';
import '../../../core/constants.dart';
import '../../../main_nav_page/presentation/main_nav_page.dart';
import 'controller/favorite_controller.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({Key? key}) : super(key: key);
  FavoriteController _favoriteController = Get.put(FavoriteController());

  Future<void> initializeSettings() async {

    _favoriteController.fetchFavorite();

    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context,snapshot){
        return Scaffold(
          appBar: AppBar(
            title: const Text('علاقه مندی ها'),
            backgroundColor: primaryColor,
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.home_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  Get.to(MainNavPage());
                  // do something
                },
              )
            ],
          ),
          body:Obx(() {
            return (_favoriteController.isLoading.value==true)?const Center(child: CupertinoActivityIndicator(color: primaryColor,),):
            RefreshIndicator(
              onRefresh: ()=> _favoriteController.fetchFavorite(),
              child: GetBuilder<FavoriteController>(
                builder: (_){
                  return ListView(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Wrap(
                            alignment: WrapAlignment.start,
                            children: List.generate(_favoriteController.favoriteList.length, (index){
                              return  AllFavoriteCart(
                                id: _favoriteController.favoriteList[index].id,
                                titleFavorite: _favoriteController.favoriteList[index].title,
                                decript: _favoriteController.favoriteList[index].description,
                                image: _favoriteController.favoriteList[index].img,);
                            },)
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          })
        );
      },

    );
  }
}




class AllFavoriteCart extends StatelessWidget {
  final String? titleFavorite;
  final String? decript;
  final String? image;
  final int? id;
   AllFavoriteCart({Key? key, required this.id, required this.titleFavorite, required this.decript, required this.image,}) : super(key: key);
  FavoriteController _favoriteController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(SinglePlacesPage(id_value: id.toString(),));
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        width: 40.w,
        // height: 30.h,

        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: grayWhiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              offset: const Offset(
                1.0,
                5.0,
              ),
              spreadRadius: 1,
              blurRadius: 3,
            ), //BoxShadow
            //BoxShadow
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: ()=>_favoriteController.removeFavorite(id.toString()),
                  child: Icon(Icons.clear),
                ),
               SizedBox(width: 8,)
              ],
            ),
            Container(
              width: 30.w,
              height: 15.h,
              margin: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(image??""),
                    fit: BoxFit.fill,
                  )
              ),
            ),
             Text(titleFavorite??""
               ,style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
               textDirection: TextDirection.rtl,
               maxLines: 3,
             ),
            const SizedBox(height: 8,),

            const SizedBox(height: 8,),
          ],
        ),
      ),
    );
  }
}
