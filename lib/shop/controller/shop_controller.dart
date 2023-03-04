




import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/shop_categories.dart';
import '../model/shop_sliders.dart';
import '../remote/shop_remote.dart';

class ShopController extends GetxController{

  var isLoading = true.obs;
  var shopCategory = <ShopCategories>[];
  var shopSlider = <ShopSliders>[];
  var products;


  // void onInit() {
  //   // TODO: implement onInit
  //   fetchProducts();
  //
  //   super.onInit();
  // }

   fetchProducts() async{
    isLoading(true);

    try{
      products = await ShopRemote.fetchshop();


        if(products != null){
          shopCategory.clear();
          products.shopCategories?.forEach((element) {
            shopCategory.add(element);
          });

          products.shopsliders?.forEach((element) {
            shopSlider.add(element);
          });
        }

    }finally{
      isLoading(false);
    }

  }


}


String? getToken() {
  final box = GetStorage();
  return box.read(CacheManagerKey.TOKEN.toString());
}

enum CacheManagerKey { TOKEN }