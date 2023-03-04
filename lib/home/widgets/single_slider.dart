




import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../model/single_brand/slider_single_brand.dart';

class SingleImageSlider extends StatelessWidget {
  List <SliderSngleBrand> slidersData;
  SingleImageSlider({Key? key,required this.slidersData} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(

      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1.0,
        aspectRatio: 1.6,
        initialPage: 2,
        enableInfiniteScroll: true,
      ),
      itemCount: slidersData.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Container(

            margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
            height: 30.h,
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(12),
              image:  DecorationImage(
                // image: NetworkImage('${Constants.baseUrl}${slidersData[itemIndex].img}' ?? '') ,
                image: NetworkImage(slidersData[itemIndex].img ?? ""),
                fit: BoxFit.fill,
              ),
            ),

          ),
    );
  }
}
