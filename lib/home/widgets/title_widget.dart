


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final String linkText;
  final String link;
  TitleWidget({Key? key,required this.title,required this.link,required this.linkText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical:24),
      padding: const EdgeInsets.symmetric(horizontal:5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){Get.toNamed(link );},
                child: Text(linkText,style: const TextStyle(fontSize:13, fontWeight: FontWeight.w900),),
              ),
              Text(title,style: const TextStyle(fontSize:13, fontWeight: FontWeight.w900),),

            ],
          ),
          const SizedBox(height: 5,),
          const Divider(
            height: 1,
            thickness: 1,
            indent: 10,

            endIndent: 10,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
