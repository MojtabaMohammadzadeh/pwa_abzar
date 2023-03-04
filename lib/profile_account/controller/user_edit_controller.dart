



import 'dart:io';

import 'package:get/get.dart';
import 'package:pwa2_abzar_sanat/profile_account/controller/user_profile_controller.dart';


import '../../main_nav_page/presentation/main_nav_page.dart';
import '../remote/user_profile_edit.dart';

class UserEditController extends GetxController{
  var isChanged = false.obs;
  ProfileController _profileController = Get.find();

  void EditUser(String Name,String Family) async{

    var response = await UpdateUser.fetchUser(Name,Family);

    if (response?.success == 1){
      isChanged(true);
      _profileController.fetchData();
      Get.off(()=> MainNavPage());
    }


  }


  void UploadImage(File file) async{

    // var response = await UpdateUser.upload(file);

  }




}