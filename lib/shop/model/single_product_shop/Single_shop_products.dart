import '../../../home/model/single_brand/slider_single_brand.dart';

import 'VipProduct.dart';


class SingleShopProducts {
  SingleShopProducts({
      this.success, 
      this.error, 
      this.errorCode, 
      this.msg, 
      this.vipProduct, 
      this.sliders,});

  SingleShopProducts.fromJson(dynamic json) {
    success = json['success'];
    error = json['error'];
    errorCode = json['error_code'];
    msg = json['msg'];
    vipProduct = json['vip_product'] != null ? VipProductSingle.fromJson(json['vip_product']) : null;
    if (json['sliders'] != null) {
      sliders = [];
      json['sliders'].forEach((v) {
        sliders?.add(SliderSngleBrand.fromJson(v));
      });
    }
  }
  int? success;
  int? error;
  int? errorCode;
  String? msg;
  VipProductSingle? vipProduct;
  List<SliderSngleBrand >? sliders;



}