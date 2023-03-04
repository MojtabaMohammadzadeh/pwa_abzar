




import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';


import '../../../../core/constants.dart';
import '../../../../main_nav_page/presentation/main_nav_page.dart';
import '../controller/new_shop_controeller.dart';
import '../controller/shop_list_controller.dart';
import 'adding_steps/add_pics.dart';


class NewShopPage extends StatelessWidget {
   NewShopPage({Key? key}) : super(key: key);

   ShopListController _shopListController = Get.put(ShopListController());
   NewShopController _newShopController = Get.put(NewShopController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('افزودن شرکت و فروشگاه',style: TextStyle(fontSize: 14),),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.home_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(MainNavPage());
              // do something
            },
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(()=>const AddingPics());
        },
        elevation: 0.5,
        backgroundColor: secondaryColor,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,



      body: GetBuilder<ShopListController>(

        builder: (_){

          return (_shopListController.ShopLists.length == 0)?
          Center(child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Text("فعلا فروشگاهی از طرف شما ثبت نشده. می تونید در این قسمت اضافه کنید.",
              style:TextStyle(fontSize: 13, fontWeight:FontWeight.w700),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
          ),)
          : ListView.builder(

              itemCount: _shopListController.ShopLists.length,
              itemBuilder: (context,index){
                return Container(
                  width: 100.w,


                  margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xffF5f5f5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        offset: const Offset(
                          1.0,
                          5.0,
                        ),
                        spreadRadius: 1,
                        blurRadius: 3,
                      ), //BoxShadow
                      //BoxShadow
                    ],
                  ),
                  
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 35.w,
                        height: 15.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: NetworkImage(_shopListController.ShopLists[index].img??""),
                            fit: BoxFit.fill,
                          )
                        ),
                      ),
                      SizedBox(height: 16,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child:Text(_shopListController.ShopLists[index].title??"",
                          style: TextStyle(fontSize: 15,fontWeight:FontWeight.w700),textAlign:TextAlign.center,),

                      ),
                      SizedBox(height: 16,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(_shopListController.ShopLists[index].address??""
                          ,style: TextStyle(fontSize: 13,fontWeight:FontWeight.w500),textAlign:TextAlign.center,),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(

                              onTap: (){
                                List<String> SlidersList = [];
                                _shopListController.ShopLists[index].slider?.forEach((element) {
                                  SlidersList.add(element.img??"");
                                });
                              _newShopController.EditPlace(
                                  SlidersList,
                                  _shopListController.ShopLists[index].id??0,
                                  _shopListController.ShopLists[index].title??"",
                                  _shopListController.ShopLists[index].address??"",
                                  _shopListController.ShopLists[index].phone??"",

                                  _shopListController.ShopLists[index].description??"",
                                  );

                              },

                              child:Container(
                                width: 102,
                                height: 27,
                                margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                                decoration: BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('ویرایش',
                                      style: TextStyle(fontSize: 12,
                                          fontWeight:FontWeight.w700,color: Colors.white
                                      ),),
                                    Icon(Icons.refresh_rounded,color: Colors.white,size: 18,)
                                  ],
                                ),
                              ) ),
                          Expanded(child: SizedBox()),
                          (_shopListController.ShopLists[index].status == 0)?
                          Text("در حال بررسی"):
                          Text("تایید شده"),
                          SizedBox(width: 16,)
                        ],
                      ),
                      SizedBox(height: 16,),
                    ],
                  ),
                  
                );
              })
          ;
        },

      )


    );
  }
}



