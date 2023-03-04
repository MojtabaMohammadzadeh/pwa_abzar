




import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:html/parser.dart' show parse;

import '../../core/constants.dart';
import '../../drawer/pages/shop_bascket/presentation/shop_bascket.dart';


import '../../home/widgets/single_slider.dart';
import '../controller/single_product_shop_controller.dart';


class SingleShopProducts extends StatelessWidget {
  final String ProductId;
   SingleShopProducts({Key? key, required this.ProductId, }) : super(key: key);

  SingleSopProController _shopProductSingle = Get.put(SingleSopProController());

  Future<void> initializeSettings() async {

   _shopProductSingle.fetchProducts(ProductId);

    //Simulate other services for 3 seconds
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:initializeSettings() ,
        builder: (context,snapshot){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
              title: Text(_shopProductSingle.title??"", style:TextStyle(fontSize:14),),
              centerTitle: true,
              actions: <Widget>[

                IconButton(
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Get.to(()=>ShopBascket() );
                    // do something
                  },
                )
              ],
            ),

            body: Obx((){
              return (_shopProductSingle.isLoading.isTrue)?(Center ( child: CupertinoActivityIndicator(
                color: primaryColor,  radius: 20,
              ),)):Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16,),

                    Expanded(child:ListView(
                      children: [
                        Column(
                          children: [
                            (_shopProductSingle.productSlider.isEmpty)?Container(
                              width: 85.w,
                              height: 35.h,
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: const BoxDecoration(
                                // borderRadius: BorderRadius.circular(15),

                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(

                                  fit:BoxFit.fill,
                                  fadeInCurve: Curves.easeIn,
                                  imageUrl: _shopProductSingle.img?? '',
                                  placeholder: (context, url) => const CupertinoActivityIndicator(
                                    color: primaryColor,  radius: 20,
                                  ),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                ),
                              ),
                            ):

                            SingleImageSlider(slidersData: _shopProductSingle.productSlider),

                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                              child: Text(_shopProductSingle.title??"",style:const TextStyle(fontSize:15,fontWeight:FontWeight.w700),),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                              child: Text("قیمت:  ${_shopProductSingle.price??""}  تومان ",
                                style:const TextStyle(fontSize:13,fontWeight:FontWeight.w700, fontFamily: "DanaFaNum"),textDirection:TextDirection.rtl,),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                              child:((_shopProductSingle.quantity??0)>0)? Text("موجودی:  ${_shopProductSingle.quantity??0} عدد ",
                                style:const TextStyle(fontSize:13,
                                    fontWeight:FontWeight.w700,
                                    fontFamily: "DanaFaNum"),
                                textDirection:TextDirection.rtl,)
                                  :const Text("عدم موجودی",
                                style:TextStyle(fontSize:13,
                                    color: metalColor
                                ),
                                textDirection:TextDirection.rtl,
                              )
                              ,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                              child:Html(data: _shopProductSingle.description??"", style: {'html':Style(textAlign: TextAlign.start,direction: TextDirection.rtl )},)


                            ),
                          ],
                        )
                      ],
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(onPressed:

                        ((_shopProductSingle.quantity)>0)?()async{
                          var response = await _shopProductSingle.addToShopList(_shopProductSingle.id.toString());

                          if (response != null){
                            _showModalDialog(context,response);
                          }else{

                          }

                        }:(){} ,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all( ((_shopProductSingle.quantity)>0)?Color(0xff003A6D):metalColor),


                            elevation: MaterialStateProperty.all(0),
                            padding:MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 16, vertical: 16)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                          ),
                          icon: const Icon(Icons.shopping_cart),
                          label: const Text("افزودن به سبد خرید",style: TextStyle(fontSize: 12),),
                        ),


                      ],
                    ),
                    const SizedBox(height: 16,),

                  ],
                ),
              );
            })
          );
        });
  }
}


_showModalDialog(context,String msg){
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.black.withOpacity(0.0),
          child: Container(

            constraints: BoxConstraints(
              maxHeight: 30.h,
              maxWidth: 98.w,
            ),
            decoration: BoxDecoration(
                color: lightGrayColor,
                borderRadius: BorderRadius.circular(16)
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                    const SizedBox(height: 16,),

                   Text(msg,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontFamily: "Dana",fontSize: 13,color: ravenColor,fontWeight:FontWeight.w700),),
                  const Expanded(child:SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 16,),
                      GestureDetector(
                        onTap: ()=>Navigator.pop(context),
                        child:  const Text("بعدا",style: TextStyle(fontSize: 13,fontWeight:FontWeight.w700),)
                      ),
                      const Expanded(child: SizedBox()),
                      ElevatedButton(
                          onPressed: (){

                            Get.off(()=>ShopBascket());

                          },
                          style: ButtonStyle(

                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),

                                  )
                              ),
                              backgroundColor:  MaterialStateProperty.all(primaryColor),

                              textStyle:
                              MaterialStateProperty.all(const TextStyle(fontSize: 13, fontWeight:FontWeight.w700,fontFamily:"Dana"))),
                          child: const Text("رفتن به سبد خرید")),
                      const SizedBox(width: 16,),

                    ],
                  ),
                  const SizedBox(height: 16,),
                ],
              ),
            ),
          ),
        );
      });
}