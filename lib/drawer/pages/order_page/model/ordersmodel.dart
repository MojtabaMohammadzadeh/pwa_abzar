

import 'orders_data.dart';

class Ordersmodel {
  Ordersmodel({
      this.status, 
      this.data,});

  Ordersmodel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(OrdersData.fromJson(v));
      });
    }
  }
  bool? status;
  List<OrdersData>? data;



}