


import 'package:pwa2_abzar_sanat/category/model/sub_category/sub_places_category.dart';

class SubCategoryModel {
  SubCategoryModel({
    required this.success,
    required this.error,
    required this.error_code,
    required this.msg,
    required this.parentName,
    required this.placescategory,});

  factory SubCategoryModel.fromJson(dynamic json) {
    List<subPlacescategory>placescategory = [];
    if (json['placescategory'] != null) {

      json['placescategory'].forEach((v) {
        placescategory.add(subPlacescategory.fromJson(v));
      });
    }
    return SubCategoryModel(
      success : json['success'],
      error : json['error'],
      error_code : json['error_code'],
      msg : json['msg'],
      parentName : json['parent_name'],
      placescategory : placescategory,
    );
  }
  int success;
  int error;
  int error_code;
  String msg;
  String parentName;
  List<subPlacescategory> placescategory;


}