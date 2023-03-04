



import 'package:get/get.dart';

import '../model/subpage_shop/vip_products.dart';
import '../remote/update_shop_cart.dart';

class ShopProductList extends GetxController{

  var ShopList = <VipProducts>[];



  removeShopCart(int id){
    for(var element in ShopList ){
      if (element.id == id){
        element.numOfShop = 0;

        update();
      }
      ShopList.remove(element);
      update();
    }
    // addToAllShopList();
    // update();
  }


  void removeFromShopList(id){
    for(var element in ShopList ){
      if (element.id == id){
        element.numOfShop = (element.numOfShop! - 1);

        update();
      }
    }

  }


  void addToShopCart(id) {
    for(var element in ShopList ){
      if (element.id == id){
        element.numOfShop = element.numOfShop! + 1;

        update();
      }
    }
  }




}