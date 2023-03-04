




import 'package:get/get.dart';

class ProductController extends GetxController{

  var isFavorited = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    isFavorited(false);
    super.onInit();
  }




}