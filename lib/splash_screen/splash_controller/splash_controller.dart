import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';



class AuthenticationManager extends GetxController with CacheManager {
  final isLogged = false.obs;
  bool isConnected = true;


  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  void login(String? token) async {
    isLogged.value = true;
    //Token is cached
    await saveToken(token);
  }

  void checkLoginStatus() {

    // GetStorage().write('mytoken', 'eyJpdiI6InBvN0ZoblZ2R1JFRmVYQi9xYnJheFE9PSIsInZhbHVlIjoieVhaRTFaZ1lMY0x4b1o1R3hnMnV0Zz09IiwibWFjIjoiMDUxYjM1ODk4NGFhMmJjMjUwNmNiMWQ2NWJlMjVhYzA4N2IyZTljMmY0ZDg2Njk3MGYzYTBkMTMzN2M4N2U5ZCIsInRhZyI6IiJ9');

    checkConncetion();
    final token = getToken();

    if (token != null) {
      isLogged.value = true;
    }

  }


  void checkConncetion() async {
    var check =  await InternetConnectionChecker().hasConnection;


    if (check == true){
      isConnected = true;
    }
    else {
      
        isConnected = false;
    }

  }



}


mixin CacheManager {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.TOKEN.toString(), token);
    GetStorage().write('mytoken', token);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.TOKEN.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.TOKEN.toString());
  }


}

enum CacheManagerKey { TOKEN }