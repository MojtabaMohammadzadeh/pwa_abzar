import 'ShopCart.dart';

class CartItems {
  CartItems({
      this.success, 
      this.error, 
      this.errorCode, 
      this.msg, 
      this.shopCart,});

  CartItems.fromJson(dynamic json) {
    success = json['success'];
    error = json['error'];
    errorCode = json['error_code'];
    msg = json['msg'];
    shopCart = json['shop_cart'] != null ? ShopCartModel.fromJson(json['shop_cart']) : null;
  }
  int? success;
  int? error;
  int? errorCode;
  String? msg;
  ShopCartModel? shopCart;



}