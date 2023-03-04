import 'Places.dart';

class NewShopLists {
  NewShopLists({
      this.success, 
      this.error, 
      this.errorCode, 
      this.msg, 
      this.nameCategory, 
      this.places, 
      this.maxUploadImgPlaces,});

  NewShopLists.fromJson(dynamic json) {
    success = json['success'];
    error = json['error'];
    errorCode = json['error_code'];
    msg = json['msg'];
    nameCategory = json['name_category'];
    if (json['places'] != null) {
      places = [];
      json['places'].forEach((v) {
        places?.add(Places.fromJson(v));
      });
    }
    maxUploadImgPlaces = json['max_upload_img_places'];
  }
  int? success;
  int? error;
  int? errorCode;
  String? msg;
  String? nameCategory;
  List<Places>? places;
  int? maxUploadImgPlaces;



}