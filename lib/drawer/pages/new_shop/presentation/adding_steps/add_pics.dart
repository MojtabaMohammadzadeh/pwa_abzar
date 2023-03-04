




import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/constants.dart';
import '../../../../../main_nav_page/presentation/main_nav_page.dart';
import '../../controller/new_shop_controeller.dart';
import 'add_cities.dart';

class AddingPics extends StatefulWidget {
  const AddingPics({Key? key}) : super(key: key);

  @override
  State<AddingPics> createState() => _AddingPicsState();
}

class _AddingPicsState extends State<AddingPics> {

  File? _image;
  XFile? pickedFile;
  final ImagePicker _picker = ImagePicker();
  Future<void> getImage() async {
    pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if(pickedFile != null){
      setState(() {
        _image = File(pickedFile!.path);
        _newShopController.SendImage(_image!);

      });
    }
  }

  NewShopController _newShopController = Get.put(NewShopController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('افزودن عکس فروشگاه',style: TextStyle(fontSize: 14),),
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

      body: Obx((){


        return(_newShopController.UploadingImg.isTrue)?Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [

            Center(child: CupertinoActivityIndicator(
              color: primaryColor,  radius: 20,
            ),),
            Center(child: Text('تصویر در حال بارگذاری است'),),
          ],
        ):
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height:16,),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                height: 48,
                child:SizedBox.expand(
                  child: ElevatedButton(
                      onPressed: ()=>getImage(),
                      style: ButtonStyle(

                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),

                              )
                          ),
                          backgroundColor:  MaterialStateProperty.all(secondaryColor),

                          textStyle:
                          MaterialStateProperty.all(const TextStyle(fontSize: 13, fontWeight:FontWeight.w700,fontFamily:"Dana"))),
                      child: const Text("افزودن عکس")),
                )
            ),
            const SizedBox(height: 16,),
            Expanded(
              child: Obx((){
                return Wrap(children:
                List.generate(_newShopController.Sliders.length, (index){
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                    width: 40.w,
                    height: 15.h,
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(12),

                        image: DecorationImage(

                            image: NetworkImage("http://sanatabzar128.ir/${_newShopController.Sliders[index]}")
                        )
                    ),

                  );    }
                ),
                );
              }),
            ),
            Container(
                width: 40.w,
                height: 48,
                child:SizedBox.expand(
                  child: ElevatedButton(
                      onPressed: (){
                            Get.to(()=>AddCities());
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
                      child: const Text("مرحله بعد")),
                )
            ),
            const SizedBox(height: 16,),

          ],
        );
      })

    );
  }
}
