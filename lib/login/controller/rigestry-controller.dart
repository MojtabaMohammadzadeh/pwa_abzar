


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../main_nav_page/presentation/main_nav_page.dart';
import '../../splash_screen/splash_controller/splash_controller.dart';
import '../remote/phone_entry_remote.dart';
import '../remote/rigestry_remote.dart';

class RigestryCodeController extends GetxController {
  final codeValue = '0'.obs;
  int codeLength = 0;
  var endSecond = false.obs;
  var erroreMsg = "".obs;
  var isError = false.obs ;


  seconEnded (){
    endSecond.value = true;

  }

  updateCode(String code) {
    codeValue.value = code;
    codeLength = codeValue.value.length ;
    update();
  }


  sendPhone(String phoneNumber) async{


     await SendPhoneRemote.sendPhoneNumber(phoneNumber);


  }




  sendCode(String phoneNumber) async {
    var codeResponse = await RigesterCodeRemote.sendRigesterCode(
        phoneNumber, codeValue.value);

    if (codeResponse?.success == 1) {

      AuthenticationManager().login(codeResponse?.token);
      Get.off(MainNavPage());
    }
    else {


      isError(true);
      erroreMsg.value = codeResponse?.msg ?? "";
    }
  }

}

