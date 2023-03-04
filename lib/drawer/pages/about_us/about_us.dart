




import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants.dart';
import '../../../home/contrroller/home_controller.dart';
import '../../../main_nav_page/presentation/main_nav_page.dart';


class AboutUsPage extends StatelessWidget {
  AboutUsPage({Key? key}) : super(key: key);
   final TabBarControll _tabcontroller = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text('درباره ما'),
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
        body: GetBuilder<TabBarControll>(
          builder: (_){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(

                  children: [
                    Container(child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: 16,),
                      IconButton(onPressed: () async{
                        final uri = Uri.parse('https://instagram.com/${_tabcontroller.instagram}');
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        } else {
                          throw 'خطایی به وجود آمده است';
                        }
                      }, icon: Image.asset('assets/img/icons8-instagram-48.png')),
                      IconButton(onPressed: () async{
                        await Clipboard.setData(ClipboardData(text:'https://instagram.com/${_tabcontroller.instagram}'));
                      }, icon: Icon(Icons.copy)),
                      Expanded(child: SizedBox()),
                      Text('آدرس اینستاگرام: ${_tabcontroller.instagram}', textDirection: TextDirection.rtl,),
                      SizedBox(width: 16,)


                    ],
                    ) ),
                    Container(child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(width: 16,),
                        IconButton(onPressed: () async{
                          final uri = Uri.parse('https://t.me/${_tabcontroller.instagram}');
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          } else {
                            throw 'خطایی به وجود آمده است';
                          }
                        }, icon: Image.asset('assets/img/icons8-telegram-50.png')),
                        IconButton(onPressed: () async{
                          await Clipboard.setData(ClipboardData(text:'https://t.me/${_tabcontroller.instagram}'));
                        }, icon: Icon(Icons.copy)),
                        Expanded(child: SizedBox()),
                        Text('آدرس تلگرام: ${_tabcontroller.telegram}', textDirection: TextDirection.rtl,),
                        SizedBox(width: 16,)


                      ],
                    ) ),
                    Container(child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(width: 16,),
                        IconButton(onPressed: () async{
                          final uri = Uri.parse('https://wa.me://${_tabcontroller.whatsapp}');
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          } else {
                            throw 'خطایی به وجود آمده است';
                          }
                        }, icon: Image.asset('assets/img/icons8-whatsapp-60.png')),
                        IconButton(onPressed: () async{
                          await Clipboard.setData(ClipboardData(text:'https://wa.me://${_tabcontroller.whatsapp}'));
                        }, icon: Icon(Icons.copy)),
                        Expanded(child: SizedBox()),
                        Text('شماره واتساپ: ${_tabcontroller.whatsapp}', textDirection: TextDirection.rtl,),
                        SizedBox(width: 16,)


                      ],
                    ) ),
                    Container(child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(width: 16,),
                        IconButton(onPressed: () async{
                          final uri = Uri.parse('https://www.${_tabcontroller.link_app}');
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          } else {
                            throw 'خطایی به وجود آمده است';
                          }
                        }, icon: Image.asset('assets/img/icons8-web-64.png')),
                        IconButton(onPressed: () async{
                          await Clipboard.setData(ClipboardData(text:'https://www.${_tabcontroller.link_app}'));
                        }, icon: Icon(Icons.copy)),
                        Expanded(child: SizedBox()),
                        Text('آدرس وبسایت: www.${_tabcontroller.instagram}', textDirection: TextDirection.rtl,),
                        SizedBox(width: 16,)


                      ],
                    ) ),




                  ],
                ),
                SizedBox(height: 50,),
                SizedBox(
                  width: 80.w,
                  child: Text(_tabcontroller.aboutUs,textAlign:TextAlign.center,),
                ),
                SizedBox(height: 16,),
                Divider(height: 2,color: metalColor,),
                SizedBox(height: 16,),
                SizedBox(
                  width: 80.w,
                  child: Text(_tabcontroller.address_contact,textAlign:TextAlign.center,),
                ),
              ],
            );
          },
        )
    );
  }
}