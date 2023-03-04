


import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pwa2_abzar_sanat/login/presentation/phone_entry.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



import '../../core/constants.dart';

import '../controller/rigestry-controller.dart';

class RigestryCode extends StatelessWidget {
  final String phoneNumber;
  RigestryCode({Key? key,required this.phoneNumber}) : super(key: key);
  RigestryCodeController rigesterController = Get.put(RigestryCodeController());

  Future<void> initializeSettings() async {

    rigesterController.sendPhone(phoneNumber);

    //Simulate other services for 3 seconds
    await Future.delayed(Duration(seconds: 150));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
        builder: (context, snapshot){
           return Scaffold(
            appBar: PreferredSize(

                preferredSize: Size.fromHeight(56.px),
                child: Directionality(textDirection: TextDirection.rtl,

                  child: AppBar(
                    elevation: 0,
                    backgroundColor: grayWhiteColor,
                    automaticallyImplyLeading: false,
                    title: Text("ورود",style: TextStyle(
                        fontFamily: "Dana",
                        color:ravenColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w700),),
                    actions: [SizedBox(width: 16.px,)],

                  ),
                )
            ),


            body: Center(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        flex:3,
                        child:Column(
                          children: [
                            SizedBox(height: 40.px,),
                            Text("لطفا کد چهار رقمی که برای شما ارسال شده را وارد کنید.",
                              style: TextStyle(fontSize: 13,
                                  fontFamily: 'Dana',
                                  fontWeight: FontWeight.w300),
                              textDirection: TextDirection.rtl,),
                            SizedBox(height: 16.px,),
                            // ****************************Text Field***************

                            Container(
                              width: 216.px,
                              height: 48.px,
                              child: PinCodeTextField(
                                keyboardType: TextInputType.number,
                                length: 4,
                                autoFocus: true,
                                animationType: AnimationType.fade,
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(12),
                                  fieldHeight: 48,
                                  fieldWidth: 48,
                                  borderWidth: 2,
                                  inactiveFillColor: Colors.white.withOpacity(0),
                                  inactiveColor: metalColor,
                                  activeColor: primaryColor,
                                  activeFillColor: primaryColor.withOpacity(0),
                                  selectedFillColor: Colors.white.withOpacity(0),
                                  selectedColor: primaryColor,

                                ),
                                textStyle: TextStyle(fontFamily: "DanaFaNum",fontSize: 13,fontWeight:FontWeight.w700),
                                animationDuration: const Duration(milliseconds: 300),

                                enableActiveFill: true,

                                appContext:context,

                                onCompleted: (String value){
                                  rigesterController.updateCode(value);
                                },
                                onSubmitted: (String value){

                                }, onChanged: (String value) {  },

                              ),

                            ),





                            // ****************************Ednd Text Field*****************
                            SizedBox(height: 16.px,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(" ثانیه"),
                                SizedBox(width: 4,),
                                TimerCountdown(
                                  format: CountDownTimerFormat.secondsOnly,
                                  enableDescriptions: false,
                                  endTime: DateTime.now().add(
                                    Duration(

                                      seconds: 180,
                                    ),
                                  ),
                                  onEnd: () {
                                    rigesterController.seconEnded();
                                  },
                                ),


                              ],
                            ),
                            SizedBox(height: 16.px,),
                            SizedBox(child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text(phoneNumber),
                                SizedBox(width: 4,),
                                Text("به این شماره ارسال کردیم:",
                                  style: TextStyle(fontFamily:'Dana',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                  textDirection: TextDirection.rtl,
                                ),

                              ],
                            )),
                            SizedBox(height: 8,),
                            SizedBox(
                              child: GestureDetector(
                                onTap: (){Get.off(PhoneEntry());},
                                child: Text("ویرایش شماره تلفن",style:TextStyle(color:primaryColor,fontSize: 14),),
                              ),
                            )
                          ],
                        )),

                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 16.px),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           Expanded(child: SizedBox()),


                            Container(
                              margin: EdgeInsets.only(right: 16.px),
                              child: GetBuilder<RigestryCodeController>(builder:(_) =>
                                  ElevatedButton(
                                      onPressed: (){

                                        rigesterController.sendCode(phoneNumber);},
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12.0),

                                          )
                                      ),
                                      backgroundColor:(rigesterController.codeLength < 3) ? MaterialStateProperty.all(metalColor): MaterialStateProperty.all(primaryColor),
                                      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 38, vertical: 14)),
                                      textStyle:
                                      MaterialStateProperty.all(const TextStyle(fontSize: 13, fontWeight:FontWeight.w700,fontFamily:"Dana"))),
                                  child: Text("بعدی")),),
                            ),

                          ],
                        ),
                      ),),


                  ],
                )


            ), );
        });
  }
}
