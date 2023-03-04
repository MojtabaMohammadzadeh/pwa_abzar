

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';



import '../../core/constants.dart';
import '../../drawer/drawer.dart';
import '../../home/widgets/search_box.dart';
import '../controller/shop_controller.dart';
import '../widgets/shopSlider.dart';
import '../widgets/shop_carts.dart';




class ShopOfSanat extends StatelessWidget {

  ShopOfSanat({Key? key}) : super(key: key);
  ShopController _shopController = Get.put(ShopController());

  Future<void> initializeSettings() async {

    _shopController.fetchProducts();

    //Simulate other services for 3 seconds
    await Future.delayed(Duration(seconds: 4));
  }
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: initializeSettings(),
        builder: (context,snapshot){
          return Scaffold(
            appBar: AppBar(

              centerTitle: true,
              title: const Text('فروشگاه',style: TextStyle(fontWeight:FontWeight.w500)),
              leading: IconButton(onPressed: () {
                Get.to(()=>HomeSearchField());
              }, icon: const Icon(Icons.search_rounded),),
              backgroundColor: primaryColor,
            ),
            endDrawer:  EndDrawer(),



            body: Obx((){
              return (_shopController.isLoading== true)?Center(child:CupertinoActivityIndicator(color: primaryColor,radius: 15,),):
              RefreshIndicator(
                onRefresh: ()=>_shopController.fetchProducts() ,
                child: Container(
                  decoration: const BoxDecoration(

                  ),
                  child: ListView(
                    children: [
                      const SizedBox(height: 16,),
                      ShopImageSlider(slidersData: _shopController.shopSlider,),
                      SizedBox(height: 16,),

                      Align(
                        alignment: Alignment.center,
                        child: Wrap(

                            children: List.generate(_shopController.shopCategory.length, (index){
                              return ShopCart(categoryData:_shopController.shopCategory, index: index,);
                            },)
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),



          );
        });


  }
}
