





import 'package:get/get.dart';

import '../../../../shop/remote/update_shop_cart.dart';
import '../model/cart_items/Items.dart';
import '../model/cart_items/Product.dart';

import '../remote/shop_cart_remote.dart';

class ShopCartController extends GetxController{

  var ShopCarts = <Items>[];
  var totalPrice = 0.obs;
  var CartProducts = <ProductShopCart>[];
  var nullObject = ProductShopCart(id:null,title:null,price:null,img:null,quantity:null,isAvailable:false);
  var isLoading = false.obs;



   getCartsItems() async{
    isLoading(true);
    var response = await ShopCartRemote.fetchshopCart();
    if (response != null){
      ShopCarts.clear();
     response.shopCart?.items?.forEach((element) {
       ShopCarts.add(element);
       update();
       isLoading(false);
     });

     totalPrice.value = response.shopCart?.totalAmount??0;
     update();

    }

  }



  void addToCarts(String product_id) async{
    isLoading(true);
   var response= await UpdateShopCart.fetchshopdetails(product_id);

   if (response != null){
     ShopCarts.clear();
     getCartsItems();
   }
  }



  void dropByCarts(String product_id) async{
    isLoading(true);
    var response= await UpdateShopCart.dropshopListitem(product_id);

    if (response != null){
      ShopCarts.clear();
      getCartsItems();
    }
  }


  void deleteCarts(String cart_id) async{
    isLoading(true);
    var response= await UpdateShopCart.removeShopCart(cart_id);

    if (response != null){
      ShopCarts.clear();
      getCartsItems();

    }
  }

}