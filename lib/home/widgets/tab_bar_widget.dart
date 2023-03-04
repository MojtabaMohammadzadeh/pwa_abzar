



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';


import '../../core/constants.dart';
import '../contrroller/home_controller.dart';
import '../model/all_brand_categories.dart';

class TabBarWidget extends StatelessWidget {
  final List<AllBrandCategories> tabsData ;
  TabBarWidget({Key? key,required this.tabsData}) : super(key: key);
  final TabBarControll _indexController = Get.put(TabBarControll());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,


      margin: const EdgeInsets.only(top: 16, right: 10),
      child: ListView.builder(
          reverse: true,
          itemCount: tabsData.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _indexController.changeIndex(index);
              },
              child: Obx((){
                return Container(
                  width: 20.w,

                  margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 3),
                  decoration: BoxDecoration(


                  ),
                  padding: const EdgeInsets.symmetric(

                    vertical: 10,

                  ),
                  child: Column(
                    children: [

                      Container(
                        width: 50,
                        height: 50,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: index == _indexController.currentIndex.value
                              ? Color(0xffF73B3F)
                              : grayWhiteColor,

                        ),
                        child: ClipRRect(

                          child: Image.network('http://sanatabzar128.ir/${tabsData[index].img}',



                          ),),
                      ),
                      const SizedBox(height: 4,),
                      Text(
                        tabsData[index].title?? '',textAlign: TextAlign.center,
                        style: TextStyle(color:ravenColor
                        ),
                      ),


                    ],
                  )
                );
              }),
            );
          }) ,
    );
  }
}
