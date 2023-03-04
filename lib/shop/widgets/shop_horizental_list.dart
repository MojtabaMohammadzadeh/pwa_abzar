




import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants.dart';
import '../model/subpage_shop/vip_subcategories.dart';
import '../presentation/single_shop_product.dart';

class ShopHorizentalList extends StatelessWidget {
  List<VipSubcategories> ListData;
  ShopHorizentalList({Key? key,required this.ListData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount:ListData.length,
        itemBuilder:(context, index){
          return Container(
            width: 100.w,
            height: 40.h,

            margin: EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text( ListData[index].title?.replaceAll("_", "") ?? '',
                  style: TextStyle(fontSize: 16,fontWeight:FontWeight.w700), textDirection:TextDirection.rtl,),
                 ),
                SizedBox(height: 8,),
                const Divider(
                  height: 2,
                  thickness: 1,
                  indent: 10,

                  endIndent: 10,
                  color: Colors.black12,
                ),
                SizedBox(height: 8,),

                Expanded(child:ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    itemCount:ListData[index].vipProducts?.length ,
                    itemBuilder:(context,item){
                      return GestureDetector(
                        onTap: () {
                           Get.to(()=>SingleShopProducts(ProductId: ListData[index].vipProducts?[item].id.toString()??"0"));

                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 5,left: 5,bottom:10, ),
                          width: 45.w,

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
                                margin: EdgeInsets.only(top: 0,bottom: 8),
                                decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(15),

                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(

                                    fit:BoxFit.fill,
                                    fadeInCurve: Curves.easeIn,
                                    imageUrl: ListData[index].vipProducts?[item].img?? '',
                                    placeholder: (context, url) => CupertinoActivityIndicator(
                                      color: primaryColor,  radius: 20,
                                    ),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16,),
                              Container(
                                  width: 35.w,
                                  child: Text(ListData[index].vipProducts?[item].title?? '',
                                    style: TextStyle(fontWeight:FontWeight.w500,fontSize:14,),
                                    textDirection: TextDirection.rtl,
                                    textAlign:TextAlign.center,)),
                              SizedBox(height: 16,),
                              Container(
                                  width: 35.w,
                                  child: Text("${ListData[index].vipProducts?[item].price?? ''}  تومان ",
                                    style: TextStyle(fontWeight:FontWeight.w700,fontSize:14,fontFamily:"DanaFaNum"),
                                    textDirection: TextDirection.rtl,
                                    textAlign:TextAlign.center,)),
                              SizedBox(height: 4,),
                              Container(
                                  width: 35.w,
                                  child:((ListData[index].vipProducts?[item].quantity??0) > 0)? Text("موجودی: ${ListData[index].vipProducts?[item].quantity?? ''}   عدد",
                                    style: TextStyle(fontWeight:FontWeight.w500,fontSize:12,fontFamily:"DanaFaNum"),
                                    textDirection: TextDirection.rtl,
                                    textAlign:TextAlign.center,):const Text("عدم موجودی",
                                    style: TextStyle(fontSize:12,color: metalColor),
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.center,
                                  )),
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
