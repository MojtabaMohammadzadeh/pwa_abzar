






import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("تماس با ما"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(

            children: [
              SizedBox(height: 16,),
              Container(
                width: 100.w,
                height: 30.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/contact_us.png'),
                        fit: BoxFit.fitHeight
                    )
                ),
              ),
              SizedBox(height: 32,),
              GestureDetector(
                onTap: (){
                  _makingPhoneCall('tel://+98513************');
                },
                child: Container(
                  width: 100.w,
                  margin: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: Center(
                    child: Text("شماره تماس ثابت: 0513........",
                      style: TextStyle(fontSize: 14,fontFamily:'DanaFaNum', fontWeight:FontWeight.w700),
                      textAlign: TextAlign.center,textDirection: TextDirection.rtl,),
                  ),
                ),
              ),
              Divider(height: 2,),
              GestureDetector(
                onTap: (){
                  _makingPhoneCall('tel://+98513************');
                },
                child: Container(
                  color: grayWhiteColor,
                  width: 100.w,
                  height: 10.h,
                  margin: EdgeInsets.symmetric( vertical: 8),
                  child: Center(
                    child: Text("شماره تماس همراه: 0513........",
                      style: TextStyle(fontSize: 14,fontFamily:'DanaFaNum', fontWeight:FontWeight.w700),
                      textAlign: TextAlign.center,textDirection: TextDirection.rtl,),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  _makingPhoneCall('tel://+98513************');
                },
                child: Container(
                  width: 100.w,
                  margin: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: Center(
                    child: Text("آدرس روبیکا: 0513........",
                      style: TextStyle(fontSize: 14,fontFamily:'DanaFaNum', fontWeight:FontWeight.w700),
                      textAlign: TextAlign.center,textDirection: TextDirection.rtl,),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  _makingPhoneCall('tel://+98513************');
                },
                child: Container(
                  color: grayWhiteColor,
                  width: 100.w,
                  height: 10.h,
                  margin: EdgeInsets.symmetric( vertical: 8),
                  child: Center(
                    child: Text("آدرس تلگرام: 0513........",
                      style: TextStyle(fontSize: 14,fontFamily:'DanaFaNum', fontWeight:FontWeight.w700),
                      textAlign: TextAlign.center,textDirection: TextDirection.rtl,),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


_makingPhoneCall(String tel) async {
  var url = Uri.parse(tel);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'امکان برقراری تماس وجود ندارد!';
  }
}