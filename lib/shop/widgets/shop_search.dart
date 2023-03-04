




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants.dart';
import '../../main_nav_page/presentation/main_nav_page.dart';
import '../controller/sub_shop_controller.dart';
import '../model/subpage_shop/vip_products.dart';
import '../model/subpage_shop/vip_subcategories.dart';
import '../presentation/single_shop_product.dart';

class ShopSearchField extends StatefulWidget {
  ShopSearchField ({Key? key}) : super(key: key);

  @override
  State<ShopSearchField > createState() => _ShopSearchFieldState();
}

class _ShopSearchFieldState extends State<ShopSearchField > {
  final TextEditingController _controller = TextEditingController();
  SubShopController _subShopController = Get.put(SubShopController());

  late List<VipSubcategories> searchTherms = [];

  late List<VipProducts> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grayWhiteColor,
      body: SafeArea(
        child: Directionality(
            textDirection: TextDirection.rtl,

            child: Column(
              children: [
                Container(
                  height: 48,
                  width: 100.w,
                  margin:EdgeInsets.symmetric(vertical: 16,horizontal: 4),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: primaryColor),
                    borderRadius: BorderRadius.circular(12),

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: (){_controller.text = '';},
                      ),

                      Expanded(
                        child: TextFormField(
                          controller: _controller,
                          onChanged: (String value){
                            searchTherms = _subShopController.vipSubCategoryList;
                            items.clear();
                            if(value.isEmpty){
                              items.clear();
                            }else{
                              searchTherms.forEach((element) {
                                element.vipProducts?.forEach((v) {
                                  if (v.title?.toLowerCase().contains(value.toLowerCase())?? false ) {
                                    items.add(v);
                                  }
                                });
                              });
                            }


                            setState(() {});
                          },
                          keyboardType: TextInputType.text,
                          autocorrect: false,

                          autofocus: true,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize:14,
                            fontFamily: "Dana",
                            fontWeight: FontWeight.w400,

                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "جستجو...",
                            hintStyle: TextStyle(color: metalColor),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: (){Get.to(()=>MainNavPage());},
                          icon: Icon(Icons.arrow_forward)),
                    ],
                  ),
                ),
                // ***************************End Search Box**************************


                Expanded(child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: (){
                          Get.to(()=>SingleShopProducts(ProductId: items[index].id.toString(),));
                        },
                        child: Container(
                          width: 100.w,
                          height: 15.h,
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),

                          decoration: BoxDecoration(
                            color: grayWhiteColor,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow:  [
                              BoxShadow(
                                color: metalColor.withOpacity(0.4),
                                offset: Offset(2.0, 3.0),
                                blurRadius: 5,
                                spreadRadius: 1,
                              ),
                            ],

                          ),
                          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),

                          child:Row(
                            children: [
                              Container(
                                width: 20.w,
                                height: 15.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: NetworkImage(items[index].img??""),
                                    fit: BoxFit.fill,
                                  )
                                ),
                              ),
                              SizedBox(width: 16,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(items[index].title??"",
                                    textDirection: TextDirection.rtl,textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 8,),
                                  Text(" قیمت: ${items[index].price??""} تومان ",
                                    textDirection: TextDirection.rtl,textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 13,fontFamily:"DanaFaNum"),
                                  ),

                                ],
                              )
                            ],
                          )
                        ),
                      );
                    }))




              ],
            )
        ),
      ),
    );
  }
}
