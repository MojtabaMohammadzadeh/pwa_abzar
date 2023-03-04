




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../splash_screen/presentation/splash_screen_presentation.dart';
import '../constants.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10.h,),
          Container(
            width: 100.w,
            height: 50.h,
            margin: const EdgeInsets.symmetric(horizontal: 16,vertical:32),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/no_internet.png'),
                fit: BoxFit.fill,

              )
            ),

          ),
          Container(
            width: 100.w,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: const Text("متاسفانه اینترنت متصل نیست!\n لطفا وضعیت اتصال خود را چک کنید و دوباره امتحان کنید."
            ,textDirection: TextDirection.rtl,textAlign:TextAlign.center,),
          ),
          const Expanded(child: SizedBox()),
          ElevatedButton(onPressed:
              (){
                    Get.off(()=>SplashScreen());
          },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),

                      )
                  ),
                  backgroundColor:MaterialStateProperty.all(secondaryColor),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 38, vertical: 14)),
                  textStyle:
                  MaterialStateProperty.all(const TextStyle(fontSize: 13, fontWeight:FontWeight.w700,fontFamily:"Dana"))),
              child: const Text("امتحان مجدد")),
          SizedBox(height: 5.h,),
        ],
      )),
    );
  }
}
