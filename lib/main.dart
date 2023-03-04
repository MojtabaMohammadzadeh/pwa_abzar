import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pwa2_abzar_sanat/splash_screen/presentation/splash_screen_presentation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/gestures.dart';

import 'package:uni_links/uni_links.dart';


import 'drawer/pages/order_page/order_page.dart';
import 'home/subpages/all_brands_list.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Future<void> initUniLinks()async{
      try{
        Uri? initialLink = await getInitialUri();


        if(initialLink != null){

          Get.toNamed(initialLink.toString().replaceAll('http://abzarsaanat.ir/', ''));
        }

      } on PlatformException {

      }
    }
    initUniLinks();


    return ResponsiveSizer(
        builder: (context, oriantation, screentype){
      return GetMaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        title: 'Flutter Demo',
        theme: ThemeData(
              fontFamily: "Dana"
        ),
        getPages: [
          GetPage(name: '/AllBrandsList', page: () => AllBrandsList()),
          GetPage(name: '/payment', page: () => OrderPage()),
        ],
        home: SplashScreen(),
      );
    }
    );
  }
}


class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}