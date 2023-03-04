



import 'package:get/get.dart';

import '../../home/model/single_brand/slider_single_brand.dart';

import '../remote/single_product_shop_remote.dart';
import '../remote/update_shop_cart.dart';

class SingleSopProController extends GetxController{

  var isLoading = false.obs;
  var productSlider = <SliderSngleBrand >[];
  var title = '';
  var quantity = 0;
  var description = '';
  var price = '';
  var isAvailable = true;
  var img = '';
  var id = 0;

  fetchProducts(String productId) async{
    isLoading(true);

    try{
     var products = await SingleProShopRemote.fetchshopPro(productId);

      if(products != null){
        productSlider.clear();
        products.sliders?.forEach((element) {
          productSlider.add(element);

        });
        title = products.vipProduct?.title??"";
        quantity = products.vipProduct?.quantity??0;
        description= products.vipProduct?.description??"";
        price = products.vipProduct?.price??"";
        isAvailable = products.vipProduct?.isAvailable??true;
        img = products.vipProduct?.img??"";
        id = products.vipProduct?.id??0;
        update();


      }

    }finally{
      isLoading(false);
    }

  }

  addToShopList(String id) async{

    var response = await UpdateShopCart.fetchshopdetails(id);
    if (response != null){
      return response.msg;
    }else{
      return response?.msg;
    }
  }
}