import 'vip_subcategories.dart';

class SubPageShopModel {
  SubPageShopModel({
      required this.success,
      required this.error,
      required this.errorCode,
      required this.msg,
      required this.vipSubcategories,});

  factory SubPageShopModel.fromJson(dynamic json) {
    List <VipSubcategories>vipSubcategories = [];
    if (json['vip_subcategories'] != null) {

      json['vip_subcategories'].forEach((v) {
        vipSubcategories.add(VipSubcategories.fromJson(v));
      });
    }
    return SubPageShopModel(
        success:json['success'] ,
        error: json['error'],
        errorCode:json['error_code'],
        msg:json['msg'],
        vipSubcategories: vipSubcategories);
  }
  int success;
  int error;
  int errorCode;
  String msg;
  List<VipSubcategories> vipSubcategories;



}