




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/constants.dart';
import '../../../../../main_nav_page/presentation/main_nav_page.dart';
import '../../controller/new_shop_controeller.dart';

class AddDetails extends StatelessWidget {
   AddDetails({Key? key}) : super(key: key);
  NewShopController _newShopController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('ورود مشخصات',style: TextStyle(fontSize: 14),),
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


      body: ListView(



        children: [
          const SizedBox(height: 20,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: 95.w,
            child: TextField(
              controller:_newShopController.addressController,
             minLines: 1,
              maxLines: 2,
              textDirection: TextDirection.rtl,
              decoration: const InputDecoration(
                  hintText: 'آدرس',

                  hintTextDirection: TextDirection.rtl
              ),
            ),
          ),
          // *****************Part 08***********************************
          const SizedBox(height: 25,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: 95.w,
            child:  TextField(

              controller: _newShopController.phoneController,
              textDirection: TextDirection.rtl,
              decoration: const InputDecoration(
                  hintText: 'تلفن ',
                  hintTextDirection: TextDirection.rtl
              ),
            ),
          ),

          // *****************Part 09***********************************
          const SizedBox(height: 25,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: 95.w,
            child:  TextField(
              controller: _newShopController.nameController,
              textDirection: TextDirection.rtl,
              decoration: const InputDecoration(
                  hintText: 'نام شرکت ',
                  hintTextDirection: TextDirection.rtl
              ),
            ),
          ),
          // *****************Part 10***********************************
          const SizedBox(height: 25,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: 95.w,
            child:  TextField(
              controller: _newShopController.descriptController,
              minLines: 1,
              maxLines: 8,
              textDirection: TextDirection.rtl,
              decoration: const InputDecoration(
                  hintText: 'توضیحات ',
                  hintTextDirection: TextDirection.rtl
              ),
            ),
          ),
          const SizedBox(height: 52,),

          // **************************Btn *****************************

          Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: 48,
              child:SizedBox.expand(
                child: ElevatedButton(
                    onPressed: (){
                      _newShopController.SubmitPlace();
                    },
                    style: ButtonStyle(

                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),

                            )
                        ),
                        backgroundColor:  MaterialStateProperty.all(secondaryColor),

                        textStyle:
                        MaterialStateProperty.all(const TextStyle(fontSize: 13, fontWeight:FontWeight.w700,fontFamily:"Dana"))),
                    child: const Text("ثبت نهایی اطلاعات")),
              )
          ),

        ],
      )


    );
  }
}
