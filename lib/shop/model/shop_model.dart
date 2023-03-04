import 'shop_categories.dart';
import 'shop_sliders.dart';

class ShopModel {
  ShopModel({
      required this.success,
      required this.error,
      required this.errorCode,
      required this.msg,
      required this.shopCategories,
      required this.shopsliders,});

  factory ShopModel.fromJson(dynamic json) {
    List <ShopCategories> shopCategories = [];
    if (json['vip_categories'] != null) {
        json['vip_categories'].forEach((v) {
        shopCategories.add(ShopCategories.fromJson(v));
      });
    }
    List <ShopSliders> shopsliders = [];
    if (json['sliders'] != null) {

      json['sliders'].forEach((v) {
        shopsliders.add(ShopSliders.fromJson(v));
      });
    }
    return ShopModel(
        success : json['success'],
        error : json['error'],
        errorCode : json['error_code'],
        msg : json['msg'],
        shopCategories: shopCategories,
        shopsliders: shopsliders,


    );
  }
  int success;
  int error;
  int errorCode;
  String msg;
  List<ShopCategories> shopCategories;
  List<ShopSliders> shopsliders;



}