


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/constants.dart';
import '../contrroller/single_brand_controller.dart';

class AboutUs extends StatelessWidget {
  AboutUs({Key? key}) : super(key: key);

  SingleBrandController _contactUsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const Expanded(child: SizedBox()),
            IconButton(onPressed: ()=>Navigator.of(context).pop(), icon:const Icon(Icons.close,size: 24,)),
            const SizedBox(width: 8,)
          ],
        ),
        const SizedBox(height: 10,),
        Text(_contactUsController.brandName,style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
        SizedBox(height: 10,),
        Text(_contactUsController.aboutDisc,style: const TextStyle(fontSize: 12),textDirection: TextDirection.rtl,),
        const SizedBox(height: 10,),

        const SizedBox(height: 50,),
      ],
    );
  }
}
