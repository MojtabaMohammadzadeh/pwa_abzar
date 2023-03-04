




import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';


import '../../../../core/constants.dart';
import '../presentation/new_address.dart';

class NewAddress extends StatelessWidget {
  const NewAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      height: 20.h,
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(child: SizedBox()),
              Directionality(
                textDirection: TextDirection.rtl,
                child: ElevatedButton.icon(
                    onPressed:(){
                      Get.to(()=>NewAddressForm());
                    },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white.withOpacity(0)),
                    elevation: MaterialStateProperty.all(0),
                  ),

                    icon: const Icon(Icons.add,color:ravenColor,),
                  label: const Text("افزودن آدرس جدید",
                    style:TextStyle(fontSize:13,color:metalColor),),

                ),
              )
            ],
          ),
          const Divider(height: 2,)
        ],
      ),
    );
  }
}
