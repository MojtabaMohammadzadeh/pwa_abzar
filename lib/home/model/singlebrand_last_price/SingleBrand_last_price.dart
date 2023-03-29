import 'LastPrice.dart';

class SingleBrandLastPrice {
  SingleBrandLastPrice({
      this.success, 
      this.error, 
      this.errorCode, 
      this.msg, 
      this.lastPrice,});

  SingleBrandLastPrice.fromJson(dynamic json) {
    success = json['success'];
    error = json['error'];
    errorCode = json['error_code'];
    msg = json['msg'];
    if (json['last_price'] != null) {
      lastPrice = [];
      json['last_price'].forEach((v) {
        lastPrice?.add(LastPrice.fromJson(v));
      });
    }
  }
  int? success;
  int? error;
  int? errorCode;
  String? msg;
  List<LastPrice>? lastPrice;



}