





import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants.dart';
import '../model/place_category.dart';
import '../presentation/single_category.dart';

class CategoryCart extends StatelessWidget {
  List <Placescategory> categoryData;
  int index;
  CategoryCart( {Key? key,required this.categoryData, required this.index

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){

         Get.to(()=> SingleCategory(categoryId: categoryData[index].id.toString(),));
      },
      child: Container(
        // Widget for Portrait
        margin: const EdgeInsets.all(8),
        width: 40.w,
        height: 30.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: metalColor),
          color: const Color(0xfff5f5f5),

          boxShadow: [
            //background color of box
            BoxShadow(
              color: Colors.black54.withOpacity(0.3),
              blurRadius: 4, // soften the shadow
              spreadRadius: 3, //extend the shadow
              offset: const Offset(
                2, // Move to right 10  horizontally
                2, // Move to bottom 10 Vertically
              ),
            ),

          ],
        ),


        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            const SizedBox(height: 5,),
            Text(categoryData[index].title??'', style: const TextStyle(fontSize:13,fontWeight: FontWeight.w700,color: ravenColor),textAlign: TextAlign.center,),


            Container(
                width: 25.w,
                height:25.w,

                margin: const EdgeInsets.symmetric(vertical: 16),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: CachedNetworkImage(

                  fit:BoxFit.fill,
                  fadeInCurve: Curves.easeIn,
                  imageUrl: categoryData[index].img ??'',
                  placeholder: (context, url) => const CupertinoActivityIndicator(
                    color: primaryColor,  radius: 20,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }

}