



import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../model/shop_sliders.dart';

class ShopImageSlider extends StatelessWidget {
  List <ShopSliders> slidersData;
  ShopImageSlider({Key? key,required this.slidersData} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(

      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 0.9,
        aspectRatio: 2.0,
        initialPage: 2,
        enableInfiniteScroll: true,
      ),
      itemCount: slidersData.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Container(

            width: 85.w,
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(25),
              image:  DecorationImage(
                // image: NetworkImage('${Constants.baseUrl}${slidersData[itemIndex].img}' ?? '') ,
                image: NetworkImage(slidersData[itemIndex].img ?? ""),
                fit: BoxFit.fitWidth,
              ),
            ),

          ),
    );
  }
}
