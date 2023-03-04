import 'vip_products.dart';

class VipSubcategories {
  VipSubcategories({
      this.id, 
      this.title, 
      this.sort, 
      this.vipProducts,});

  VipSubcategories.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    sort = json['sort'];
    if (json['vip_products'] != null) {
      vipProducts = [];
      json['vip_products'].forEach((v) {
        vipProducts?.add(VipProducts.fromJson(v));
      });
    }
  }
  int? id;
  String? title;
  int? sort;
  List<VipProducts>? vipProducts;



}