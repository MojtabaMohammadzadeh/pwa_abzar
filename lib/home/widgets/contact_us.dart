



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/constants.dart';
import '../contrroller/single_brand_controller.dart';

class ContactUs extends StatelessWidget {
   ContactUs({Key? key}) : super(key: key);
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
        const SizedBox(height: 10,),
        Row(
          children: [
            IconButton(onPressed: () async{
              await Clipboard.setData(ClipboardData(text: _contactUsController.phone.toString()));

            }, icon: const Icon(Icons.copy_outlined)),
            const Expanded(child: SizedBox()),
            Text(_contactUsController.phone.toString(),style: const TextStyle(fontSize: 13, fontFamily:"DanaFaNum",),),
            const SizedBox(width: 8,),
            const Icon(Icons.phone),
            const SizedBox(width: 16,)
          ],
        ),

        const SizedBox(height: 8,),
        const Divider(height: 2,color:Colors.black38,),
        const SizedBox(height: 8,),
        Row(
          children: [
            IconButton(onPressed: () async{

              await Clipboard.setData(ClipboardData(text: _contactUsController.fax.toString()));
            }, icon: const Icon(Icons.copy_outlined)),
            const Expanded(child: SizedBox()),
            Text(_contactUsController.fax.toString(),style: const TextStyle(fontSize: 13, fontFamily:"DanaFaNum",),),
            const SizedBox(width: 8,),
            const Icon(Icons.location_on),
            const SizedBox(width: 16,)
          ],
        ),
        const SizedBox(height: 8,),
        const Divider(height: 2,color:Colors.black38,),
        const SizedBox(height: 8,),
        Row(
          children: [
            IconButton(onPressed: () async{

              await Clipboard.setData(ClipboardData(text: _contactUsController.insta.toString()));
            }, icon: const Icon(Icons.copy_outlined)),
            const Expanded(child: SizedBox()),
            Text(_contactUsController.insta.toString(),style: const TextStyle(fontSize: 13, fontFamily:"DanaFaNum",),),
            const SizedBox(width: 8,),
            const Icon(Icons.web_rounded),
            const SizedBox(width: 16,)
          ],
        ),
        const SizedBox(height: 58,),

        const SizedBox(height: 50,),
      ],
    );
  }
}
