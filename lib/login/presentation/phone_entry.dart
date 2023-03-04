


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pwa2_abzar_sanat/login/presentation/rigestry_code.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../core/constants.dart';
import '../controller/phone_entry_controller.dart';

class PhoneEntry extends StatelessWidget {
  
  var maskFormatter = new MaskTextInputFormatter(
  mask: '#### ### ## ##',
  filter: { "#": RegExp(r'[0-9]') },
  type: MaskAutoCompletionType.lazy
);
  final PhoneEntryController phoneController = Get.put(PhoneEntryController());
TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.px),
          child: Directionality(textDirection: TextDirection.rtl,

            child: AppBar(
              elevation: 0,
              backgroundColor: grayWhiteColor,

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
                  Text("لطفا شماره موبایل خود را وارد نمایید.",
                    style: TextStyle(fontSize: 13,
                        fontFamily: 'Dana',
                        fontWeight: FontWeight.w300),
                    textDirection: TextDirection.rtl,),
                  SizedBox(height: 16.px,),
                  // ****************************Text Field***************

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.px),
                    margin: EdgeInsets.symmetric(horizontal: 16.px),
                    height: 48.px,
                    decoration: BoxDecoration(
                      border: Border.all(color: secondaryColor,width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      controller: _controller,
                      onChanged:(content){phoneController.checkTextField(_controller.text.length);}  ,
                      keyboardType: TextInputType.phone,
                      autocorrect: false,
                      inputFormatters: [maskFormatter],
                      autofocus: true,
                      style: TextStyle(
                          fontSize:16,
                          fontFamily: "DanaFaNum",
                          fontWeight: FontWeight.w900
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none
                      ),
                    ),
                  ),





                    // ****************************Ednd Text Field*****************
                  SizedBox(height: 10.px,),
                  SizedBox(child: Text("کد احراز هویت برای این شماره ارسال می\u200cگردد.",
                    style: TextStyle(fontFamily:'Dana',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                    textDirection: TextDirection.rtl,),),
                ],
              )),

            Flexible(
              flex: 2,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.px,vertical: 16.px),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Expanded(child: SizedBox()),



                  Obx(() {
                    return ElevatedButton(onPressed: (phoneController.textFieldCheck.value == 14 ) ? (){ Get.off(()=> RigestryCode(phoneNumber: _controller.text.replaceAll(" ", "")));}:(){},
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),

                                )
                            ),
                            backgroundColor:(phoneController.textFieldCheck.value == 14) ? MaterialStateProperty.all(secondaryColor): MaterialStateProperty.all(metalColor),
                            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 38, vertical: 14)),
                            textStyle:
                            MaterialStateProperty.all(const TextStyle(fontSize: 13, fontWeight:FontWeight.w700,fontFamily:"Dana"))),
                        child: Text("بعدی"));
                  })
                ],
              ),
            ),),
          ],
        )


        ), );


  }
}
