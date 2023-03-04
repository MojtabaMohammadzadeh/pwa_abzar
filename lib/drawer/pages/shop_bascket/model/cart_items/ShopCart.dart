import 'Items.dart';

class ShopCartModel {
  ShopCartModel({
      this.items, 
      this.totalAmount,});

  ShopCartModel.fromJson(dynamic json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
    totalAmount = json['total_amount'];
  }
  List<Items>? items;
  int? totalAmount;



}