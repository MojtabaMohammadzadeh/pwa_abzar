import 'Divisions.dart';
import 'Cities.dart';
import 'ListTypePlaces.dart';
import 'PlaceCategories.dart';
import 'Sub_place_category.dart';

class NewShopModel {
  NewShopModel({
      this.success, 
      this.error, 
      this.errorCode, 
      this.msg, 
      this.divisions, 
      this.cities, 
      this.placeCategories, 
      this.listTypePlaces,
      this.subPlaceCategory,
  });

  NewShopModel.fromJson(dynamic json) {
    success = json['success'];
    error = json['error'];
    errorCode = json['error_code'];
    msg = json['msg'];
    if (json['divisions'] != null) {
      divisions = [];
      json['divisions'].forEach((v) {
        divisions?.add(Divisions.fromJson(v));
      });
    }
    if (json['cities'] != null) {
      cities = [];
      json['cities'].forEach((v) {
        cities?.add(Cities.fromJson(v));
      });
    }
    if (json['placeCategories'] != null) {
      placeCategories = [];
      json['placeCategories'].forEach((v) {
        placeCategories?.add(PlaceCategories.fromJson(v));
      });
    }
    if (json['list_type_places'] != null) {
      listTypePlaces = [];
      json['list_type_places'].forEach((v) {
        listTypePlaces?.add(ListTypePlaces.fromJson(v));
      });
    }
    if (json['sub_placesCategory'] != null) {
    subPlaceCategory = [];
      json['sub_placesCategory'].forEach((v) {
      subPlaceCategory?.add(SubPlaceCategory.fromJson(v));
      });
    }

  }
  int? success;
  int? error;
  int? errorCode;
  String? msg;
  List<Divisions>? divisions;
  List<Cities>? cities;
  List<PlaceCategories>? placeCategories;
  List<ListTypePlaces>? listTypePlaces;
  List<SubPlaceCategory>? subPlaceCategory;


}