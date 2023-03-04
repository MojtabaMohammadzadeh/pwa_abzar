


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


import '../../core/constants.dart';
import '../model/all_brands.dart';
import '../subpages/single_brand.dart';


class AllBrandsGrid extends StatelessWidget {
  List <AllBrands> GridData;
  AllBrandsGrid({Key? key, required this.GridData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: LazyLoadScrollView(
        scrollOffset: 25,
        onEndOfPage: (){},
        child: Wrap(children:
          List.generate(GridData.length, (index){
            return AllCart(GridData[index]);    }
          ),
        ),
      ),
    );
  }
}



class AllCart extends StatelessWidget {

  final AllBrands singleBrand;


  AllCart(this.singleBrand);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(SingleBrandPage(idBrand: singleBrand.id.toString()));
      },
      child: Container(
        margin: const EdgeInsets.all(3),
        width: 30.w,
        height: 20.h,

        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(color:metalColor,width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(
                1.0,
                2.0,
              ),
              spreadRadius: 1,
              blurRadius: 4,
            ), //BoxShadow
            //BoxShadow
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(singleBrand.img?? " "),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(singleBrand.name?? 'Not'
                ,style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                maxLines:3,
                textDirection:TextDirection.rtl,textAlign:TextAlign.center,),
            ),


            // const Text(' محصولات 3535 مورد',style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,color: Colors.black45),),
          ],
        ),
      ),
    );
  }
}



class LoadingContainer extends StatelessWidget {
  const LoadingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

