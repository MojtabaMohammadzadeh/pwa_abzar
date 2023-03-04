




import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation/rigestry_code.dart';
import '../remote/phone_entry_remote.dart';

class PhoneEntryController extends GetxController{

  var textFieldCheck = 0.obs;

  void  checkTextField(int number){
    textFieldCheck.value = number ;

  }



}