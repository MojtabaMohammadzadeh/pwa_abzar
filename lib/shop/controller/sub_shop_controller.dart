







import 'package:get/get.dart';


import '../model/subpage_shop/vip_products.dart';
import '../model/subpage_shop/vip_subcategories.dart';
import '../remote/sub_shop_remote.dart';

class SubShopController extends GetxController{
  var isLoading = true.obs;
  var vipSubCategoryList = <VipSubcategories>[];





  void fetchSubCategory(String idCategory) async {
    isLoading(true);
    var IdCategory = idCategory ;
    try{

      var products = await SubShopRemote.fetchSubShop(IdCategory);

      if (products != null){



        products.vipSubcategories.forEach((element) {
          vipSubCategoryList.add(element);

          update();
        });

      }
    }finally{
      isLoading(false);
    }

  }





}