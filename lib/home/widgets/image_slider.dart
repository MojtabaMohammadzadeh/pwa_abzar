

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../model/slider.dart';
import '../subpages/single_brand.dart';

class ImageSlider extends StatelessWidget {
  List <Sliders1> slidersData;
  ImageSlider({Key? key,required this.slidersData} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(12),
      ),
      child: CarouselSlider.builder(

        options: CarouselOptions(

          autoPlay: true,
          viewportFraction: 1.0,
          aspectRatio: 1.2,
          initialPage: 2,
          enableInfiniteScroll: true,
        ),
        itemCount: slidersData.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            GestureDetector(
              onTap: (){Get.to(()=>SingleBrandPage(idBrand: slidersData[itemIndex].id_value.toString(),));},
              child: Container(

                margin: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                height: 40.h,
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(12),
                  image:  DecorationImage(
                    // image: NetworkImage('${Constants.baseUrl}${slidersData[itemIndex].img}' ?? '') ,
                    image: NetworkImage(slidersData[itemIndex].img ?? ""),
                    fit: BoxFit.fill,
                  ),
                ),

              ),
            ),
      ),
    );
  }
}
