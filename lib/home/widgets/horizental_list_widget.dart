


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../model/all_brands.dart';
import '../subpages/single_brand.dart';

class HorizentalList extends StatelessWidget {

  List<AllBrands> listData ;
  HorizentalList({Key? key, required this.listData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 15.h,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: LazyLoadScrollView(
        onEndOfPage: () => {},
          scrollOffset: 5,
          child: ListView.builder(
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount: listData.length,
            itemBuilder:(context,index){
              return GestureDetector(
                onTap: (){

                  Get.to(()=>SingleBrandPage(idBrand: listData[index].id.toString()));
                },
                child: FittedBox(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10 ),
                    // constraints: BoxConstraints(minWidth: 15.w),
                    width: 20.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          width: 1,
                          color: Colors.black38,
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(


                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image:  DecorationImage(
                              image: NetworkImage(listData[index].img ?? ""),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.symmetric(horizontal:8),
                          child: Text(listData[index].name??''
                            ,style: const TextStyle(fontSize: 7,),
                            maxLines:3,
                            textDirection: TextDirection.rtl,textAlign: TextAlign.center,),
                        ),
                        const SizedBox(height: 8,),

                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

