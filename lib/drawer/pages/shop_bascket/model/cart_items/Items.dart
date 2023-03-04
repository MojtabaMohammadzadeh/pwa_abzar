import 'Product.dart';

class Items {
  Items({
      this.id, 
      this.cartItemQuantity, 
      this.totalPrice, 
      this.product,});

  Items.fromJson(dynamic json) {
    id = json['id'];
    cartItemQuantity = json['cart_item_quantity'];
    totalPrice = json['total_price'];
    product = json['product'] != null ? ProductShopCart.fromJson(json['product']) : null;
  }
  int? id;
  int? cartItemQuantity;
  int? totalPrice;
  ProductShopCart? product;



}