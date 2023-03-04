





import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';


import '../../core/constants.dart';
import '../model/shop_categories.dart';
import '../presentation/sub_shop_page.dart';

class ShopCart extends StatelessWidget {
  List <ShopCategories> categoryData;
  int index;
  ShopCart( {Key? key,required this.categoryData, required this.index

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){

        Get.to(()=> SubShopPage(categoryId: categoryData[index].id.toString(), title: categoryData[index].title?? "",));
      },
      child: Container(
        // Widget for Portrait
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(16),
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),

          color: Color(0xfff5f5f5),
          border: Border.all(width: 2, color: metalColor),

          boxShadow: [
            //background color of box
            BoxShadow(
              color: Colors.black54.withOpacity(0.2),
              blurRadius: 4, // soften the shadow
              spreadRadius: 3, //extend the shadow
              offset: Offset(
                2, // Move to right 10  horizontally
                2, // Move to bottom 10 Vertically
              ),
            ),

          ],
        ),


        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: 8,),

            Container(
              width: 35.w,
              height:25.w,

              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(

                  fit:BoxFit.fill,
                  fadeInCurve: Curves.easeIn,
                  imageUrl: categoryData[index].img ??'',
                  placeholder: (context, url) => CupertinoActivityIndicator(
                    color: primaryColor,  radius: 20,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),

            ),

            SizedBox(height: 8,),
            Text(categoryData[index].title??'', style: TextStyle(fontSize:13,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),



          ],
        ),
      ),
    );
  }

}