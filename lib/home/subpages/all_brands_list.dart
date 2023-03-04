




import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pwa2_abzar_sanat/home/subpages/single_brand.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


import '../../core/constants.dart';
import '../../main_nav_page/presentation/main_nav_page.dart';
import '../contrroller/home_controller.dart';

class AllBrandsList extends StatelessWidget {

  AllBrandsList({Key? key}) : super(key: key);
  final TabBarControll _tabcontroller = Get.put(TabBarControll());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor:primaryColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(
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

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // BuildSearch(text: ''),
          Expanded(
            child:LazyLoadScrollView(
              onEndOfPage: (){},
              child: ListView.builder(

                  itemCount: _tabcontroller.categorizedAllBrand.length,
                  itemBuilder:(context,index){
                    return GestureDetector(
                      onTap: (){
                        Get.to(
                            SingleBrandPage(
                              idBrand: _tabcontroller.categorizedAllBrand[index].id.toString()));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 15, right: 10,left: 10),
                        width: 85.w,
                        height: 15.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xfff5f5f5),
                          // border: Border.all(width: 1, color: Colors.black45),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              offset: Offset(2.0, 3.0),
                              blurRadius: 3,
                              spreadRadius: 1,
                            ),
                          ],




                        ),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(3.w),
                                width:25.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(_tabcontroller.categorizedAllBrand[index].img?? ''),
                                  ),
                                ),

                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Flexible(child: Text(_tabcontroller.categorizedAllBrand[index].name??'',style: TextStyle( fontWeight: FontWeight.w700,overflow:TextOverflow.ellipsis),)),
                                  // SizedBox(height: 15,),
                                  // Text('تعداد محصول 35 مورد',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black45),),



                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  } ),
            ), ),
        ],
      ),
    );
  }
}
