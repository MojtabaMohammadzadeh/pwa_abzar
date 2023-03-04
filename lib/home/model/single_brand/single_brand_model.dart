import 'About.dart';
import 'contact.dart';
import 'list_category.dart';
import 'single_brand.dart';
import 'slider_single_brand.dart';
import 'last_price_single_brand.dart';

class SingleBrandModel {
  SingleBrandModel({
    required this.success,
    required this.error,
    required this.error_code,
    required this.msg,
    required this.singleBrand,
    required this.listCategory,
    required this.slider,
    required this.lastPrice,
    required this.contact,
    required this.about,
  });

  factory SingleBrandModel.fromJson(dynamic json) {

    List<ListCategory>listCategory = [];
    if (json['list_category'] != null) {
      json['list_category'].forEach((v) {
        listCategory.add(ListCategory.fromJson(v));
      });
    }

    List <SliderSngleBrand>slider = [];
    if (json['slider'] != null) {

      json['slider'].forEach((v) {
        slider.add(SliderSngleBrand.fromJson(v));
      });
    }

    List <LastPriceSingleBrand>lastPrice = [];
    if (json['last_price'] != null) {

      json['last_price'].forEach((v) {
        lastPrice.add(LastPriceSingleBrand .fromJson(v));
      });
    }
    return SingleBrandModel(
      success : json['success'],
      error : json['error'],
      error_code : json['error_code'],
      msg : json['msg'],
      singleBrand : json['single_brand'] != null ? SingleBrand.fromJson(json['single_brand']) : null,
      contact: json['contact'] !=null? Contact.fromJson(json['contact']): null,
      about: json['about'] !=null ? About.fromJson(json['about']): null,
      listCategory : listCategory,
      slider : slider,
      lastPrice : lastPrice,
    );
  }
  int? success;
  int? error;
  int? error_code;
  String? msg;
  SingleBrand? singleBrand;
  List<ListCategory>? listCategory;
  List<SliderSngleBrand>? slider;
  List<LastPriceSingleBrand >? lastPrice;
  Contact? contact;
  About? about;



}