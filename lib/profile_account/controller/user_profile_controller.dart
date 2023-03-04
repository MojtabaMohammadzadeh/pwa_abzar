



import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


import '../remote/user_profile_remote.dart';

class ProfileController extends GetxController{
  final token = getToken();

  String name = '';
  String family = '';
  String phoneNumber = '';
  var img = ''.obs;



  void onInit() {
    // TODO: implement onInit
    fetchData();

    super.onInit();
  }

  void fetchData() async{




      var datas = await UserRemote.fetchUser(token ?? "");

      if (datas != null){

       name = datas.userDetail.name ??"";
       family = datas.userDetail.family ?? "";
       img.value = datas.userDetail.img ??"";
       phoneNumber = datas.userDetail.phoneNumber ?? "";
       update();

      }else{
        name = "نام";
        family = "نام خانوادگی";
        phoneNumber = "شماره تماس";
        update();
      }



  }


}



String? getToken() {
  final box = GetStorage();
  return box.read(CacheManagerKey.TOKEN.toString());
}

enum CacheManagerKey { TOKEN }