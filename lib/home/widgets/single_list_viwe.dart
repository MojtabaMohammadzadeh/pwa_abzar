



import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import 'package:responsive_sizer/responsive_sizer.dart';


import '../../core/constants.dart';
import '../model/single_brand/list_category.dart';
import '../subpages/products.dart';

class SingleListViwe extends StatelessWidget {

  List <ListCategory> ListData;
  SingleListViwe({Key? key,required this.ListData }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return LazyLoadScrollView(
      onEndOfPage: (){},
      child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount:ListData.length,
          itemBuilder:(context, index){
            return Container(
              width: 100.w,
              height: 30.h,

              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: Text( ListData[index].name ?? '', style:const TextStyle(fontSize: 16,fontWeight:FontWeight.w500,),)),
                  const Divider(
                    height: 2,
                    thickness: 1,
                    indent: 10,

                    endIndent: 10,
                    color: Colors.black12,
                  ),
                  const SizedBox(height: 8,),
                  Expanded(child:ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      itemCount:ListData[index].products.length ,
                      itemBuilder:(context,item){
                        return GestureDetector(
                          onTap: () {
                            Get.to(()=>ProductsPage(productData: ListData[index].products, Index: item,));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 16,bottom:10, ),
                            width: 45.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(width: 1, color: Colors.black12),
                              color: const Color(0xfff5f5f5),
                              boxShadow: [
                                BoxShadow(
                                  color:Colors.grey.withOpacity(0.3),

                                  offset: const Offset(
                                    0.0,
                                    5.0,
                                  ),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                ), //BoxShadow
                                //BoxShadow
                              ],
                            ),

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 30.w,
                                  height: 13.h,
                                  margin: const EdgeInsets.only(top: 3,bottom: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                                                    ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: CachedNetworkImage(
                                    width: 30.w,
                                    height: 13.h,
                                    fit:BoxFit.fill,
                                    fadeInCurve: Curves.easeIn,
                                    imageUrl: ListData[index].products[item].img,
                                    placeholder: (context, url) => const CupertinoActivityIndicator(
                                      color: primaryColor,  radius: 20,
                                    ),
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                  ),
                                ),

                                ),

                                Text(ListData[index].products[item].title,style: const TextStyle(fontWeight:FontWeight.w600,fontSize:10,),textDirection: TextDirection.rtl,textAlign:TextAlign.center,),
                              ],
                            ),
                          ),
                        );
                      }), ),
                ],
              ),
            );


          } ),
    );




  }
}
