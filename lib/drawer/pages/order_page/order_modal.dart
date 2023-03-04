




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants.dart';

class OrderModal extends StatelessWidget {
  final String titleModal;
  final String address;
  final String Message;
  final String Date;
  final String refralCode;
  const OrderModal({Key? key, required this.titleModal, required this.address, required this.Message, required this.Date, required this.refralCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("جزئیات سفارش"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                SizedBox(height: 10.h,),
                Container(
                  width: 100.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/delivery.png'),
                      fit: BoxFit.fitHeight
                    )
                  ),
                ),
                SizedBox(height: 32,),
                Text("عنوان خرید: ${titleModal}"
              ,style: const TextStyle(fontSize: 19),),
                const SizedBox(height: 32,),
                Text("کد پیگیری: ${refralCode}",style: const TextStyle(fontSize: 14),textDirection: TextDirection.rtl,),
                const SizedBox(height: 32,),
                Text("آدرس مقصد: ${address}",style: const TextStyle(fontSize: 14),textDirection: TextDirection.rtl,),
                const SizedBox(height: 32,),
                Text("وضعیت خرید: ${Message}",style: const TextStyle(fontSize: 14),textDirection: TextDirection.rtl,),
                const SizedBox(height: 32,),
                Text('تاریخ ثبت سفارش: ${Date}',style: const TextStyle(fontSize: 14),textDirection: TextDirection.rtl,),
                const SizedBox(height:32,),
                ElevatedButton(onPressed:(){
                  _makingPhoneCall('tel://+989395100617');

                },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all( secondaryColor),


                      elevation: MaterialStateProperty.all(0),
                      padding:MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 32, vertical: 8)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5))),
                    ),
                    child: const Text('تماس با پشتیبانی',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),)),
                const SizedBox(height: 50),


              ],
            ),
          ],
        ),
      ),
    );
  }
  _makingPhoneCall(String tel) async {
    var url = Uri.parse(tel);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'امکان برقراری تماس وجود ندارد!';
    }}
}


