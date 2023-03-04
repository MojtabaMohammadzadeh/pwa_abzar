




import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants.dart';
import '../model/sub_category/sub_places_category.dart';
import '../presentation/single_places_page.dart';

class CategoryHorizentalList extends StatelessWidget {
  List<subPlacescategory> ListData;
   CategoryHorizentalList({Key? key,required this.ListData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                Text( ListData[index].title ?? '',style: const TextStyle(fontSize: 13,fontWeight:FontWeight.w700),),
                const SizedBox(height: 8,),
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
                    itemCount:ListData[index].list_sliders?.length ,
                    itemBuilder:(context,item){
                      return GestureDetector(
                        onTap: () {
                          Get.to(()=>SinglePlacesPage( id_value: ListData[index].list_sliders![item].id_value.toString(), ));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 5,left: 5,bottom:10, ),
                          width: 35.w,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
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
                                width: 25.w,
                                height: 10.h,
                                margin: const EdgeInsets.only(top: 0,bottom: 8),
                                decoration: const BoxDecoration(
                                  // borderRadius: BorderRadius.circular(15),

                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(

                                    fit:BoxFit.fill,
                                    fadeInCurve: Curves.easeIn,
                                    imageUrl: ListData[index].list_sliders?[item].img?? '',
                                    placeholder: (context, url) => const CupertinoActivityIndicator(
                                      color: primaryColor,  radius: 20,
                                    ),
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 35.w,
                                  child: Text(ListData[index].list_sliders?[item].name?? '',
                                    style: const TextStyle(fontWeight:FontWeight.w300,fontSize:12,),
                                    textDirection: TextDirection.rtl,
                                    textAlign:TextAlign.center,)),
                            ],
                          ),
                        ),
                      );
                    }), ),
              ],
            ),
          );


        } );
  }
}
