import 'favorite_places.dart';

class FavoriteModel {
  FavoriteModel({
      this.success, 
      this.error, 
      this.errorCode, 
      this.msg, 
      this.places,});

  FavoriteModel.fromJson(dynamic json) {
    success = json['success'];
    error = json['error'];
    errorCode = json['error_code'];
    msg = json['msg'];
    if (json['places'] != null) {
      places = [];
      json['places'].forEach((v) {
        places?.add(FavoritePlaces.fromJson(v));
      });
    }
  }
  int? success;
  int? error;
  int? errorCode;
  String? msg;
  List<FavoritePlaces>? places;



}