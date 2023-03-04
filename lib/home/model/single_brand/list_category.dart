import 'products.dart';

class ListCategory {
  ListCategory({
    required this.id,
    required this.name,
    required this.idBrand,
    required this.img,
    required this.sort,
    required this.products,});

  factory ListCategory.fromJson(dynamic json) {
    List<Products>products = [];
    if (json['list_products'] != null) {

      json['list_products'].forEach((v) {
        products.add(Products.fromJson(v));
      });
    }
    return ListCategory(
      id : json['id'],
      name : json['name'],
      idBrand : json['id_brand'],
      img : json['img'],
      sort : json['sort'],
      products:products,
    );
  }
  int? id;
  String? name;
  int? idBrand;
  String? img;
  int? sort;
  List<Products> products;



}