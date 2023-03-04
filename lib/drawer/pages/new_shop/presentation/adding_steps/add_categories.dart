


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/constants.dart';
import '../../../../../main_nav_page/presentation/main_nav_page.dart';
import '../../controller/new_shop_controeller.dart';
import 'add_details.dart';

class AddCategories extends StatelessWidget {
  AddCategories({Key? key}) : super(key: key);
  NewShopController _newShopController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('انتخاب دسته بندی',style: TextStyle(fontSize: 14),),
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

      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 48,vertical: 16),
            child: const Text("لطفا موارد را به ترتیب انتخاب کنید.",
              style: TextStyle(fontSize: 13),textAlign: TextAlign.center, textDirection:TextDirection.rtl,
            ), ),
          const SizedBox(height: 16,),
          Container(
            width: 100.w,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child:const Text('انتخاب دسته بندی',
              style: TextStyle(fontSize:13,fontWeight: FontWeight.w700),
              textDirection: TextDirection.rtl,),

          ),
          const SizedBox(height: 8,),
          const Divider( height: 3,thickness: 2,indent: 10, endIndent: 10, color: Colors.black12, ),
          Container(
              width: 80.w,
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Obx((){
                  return DropdownButton<String>(
                    underline:const SizedBox.shrink(),
                    isExpanded: true,
                    iconSize: 36,
                    icon: const Icon(Icons.keyboard_arrow_down),

                    value: _newShopController.selectedListPlace.value,
                    onChanged: ( newValue){

                      _newShopController.ChangeList(newValue!);
                    }, items: _newShopController.listPlaces.map((valueItems){
                    return DropdownMenuItem<String>(
                        alignment: AlignmentDirectional.center,
                        value: valueItems.name,
                        child: Text(valueItems.name??'',style: const TextStyle(fontSize: 13),));
                  }).toList(),
                  );
                }),
              )
          ),
          const SizedBox(height:30,),
          Container(
            width: 100.w,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child:const Text('انتخاب زیرمجموعه',
              style: TextStyle(fontSize:13,fontWeight: FontWeight.w700),
              textDirection: TextDirection.rtl,),

          ),
          const SizedBox(height: 8,),
          const Divider( height: 3,thickness: 2,indent: 10, endIndent: 10, color: Colors.black12, ),
          Container(
              width: 80.w,
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Obx((){
                  return DropdownButton<String>(
                    underline:const SizedBox.shrink(),
                    isExpanded: true,
                    iconSize: 36,
                    icon: const Icon(Icons.keyboard_arrow_down),

                    value: _newShopController.selectedCategory.value,
                    onChanged: ( newValue){

                      _newShopController.ChangeCategory(newValue!);
                    }, items: _newShopController.categorizedPlaceCategory.map((valueItems){
                    return DropdownMenuItem<String>(
                        alignment: AlignmentDirectional.center,
                        value: valueItems.title,
                        child: Text(valueItems.title!,style: const TextStyle(fontSize: 13),));
                  }).toList(),
                  );
                }),
              )
          ),
          const SizedBox(height:30,),

          const Expanded(child: SizedBox()),

          // *************************************Btn**************************************************
          SizedBox(
              width: 40.w,
              height: 48,
              child:SizedBox.expand(
                child: ElevatedButton(
                    onPressed: (){
                      Get.to(()=>AddDetails());},
                    style: ButtonStyle(

                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),

                            )
                        ),
                        backgroundColor:  MaterialStateProperty.all(primaryColor),

                        textStyle:
                        MaterialStateProperty.all(const TextStyle(fontSize: 13, fontWeight:FontWeight.w700,fontFamily:"Dana"))),
                    child: const Text("مرحله بعد"))
              )
          ),
          const SizedBox(height: 16,),
        ],
      ),
    );
  }
}
