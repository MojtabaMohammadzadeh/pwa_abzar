





import 'package:pwa2_abzar_sanat/category/model/place_category.dart';

class AllCategoryModel {
  AllCategoryModel({
    required this.success,
    required this.error,
    required this.error_code,
    required this.msg,
    required this.placescategory,});

  factory AllCategoryModel.fromJson(dynamic json) {
    List<Placescategory> placescategory = [];
    if (json['placescategory'] != null) {

      json['placescategory'].forEach((v) {
        placescategory.add(Placescategory.fromJson(v));
      });
    }
    return AllCategoryModel (
      success : json['success'],
      error : json['error'],
      error_code : json['error_code'],
      msg : json['msg'],
      placescategory : placescategory,
    );
  }
  int? success;
  int? error;
  int? error_code;
  String? msg;
  List<Placescategory>? placescategory;



}