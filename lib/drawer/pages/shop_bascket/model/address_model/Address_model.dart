import 'Data.dart';

class AddressModel {
  AddressModel({
      this.status,
      this.data,});

  AddressModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(addressData.fromJson(v));
      });
    }
  }
  bool? status;
  List<addressData>? data;



}