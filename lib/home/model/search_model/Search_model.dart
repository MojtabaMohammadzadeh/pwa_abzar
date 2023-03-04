class SearchModel {
  SearchModel({
      this.success, 
      this.error, 
      this.errorCode, 
      this.msg, 
      this.list,});

  SearchModel.fromJson(dynamic json) {
    success = json['success'];
    error = json['error'];
    errorCode = json['error_code'];
    msg = json['msg'];
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((v) {
        list?.add(ListSearch.fromJson(v));
      });
    }
  }
  int? success;
  int? error;
  int? errorCode;
  String? msg;
  List<ListSearch>? list;



}


class ListSearch {
ListSearch({
    this.id,
    this.brandId,
    this.title,
    this.img,
    this.categoryBrandId,
    this.sort,
    this.type,});

ListSearch.fromJson(dynamic json) {
    id = json['id'];
    brandId = json['brand_id'];
    title = json['title'];
    img = json['img'];
    categoryBrandId = json['category_brand_id'];
    sort = json['sort'];
    type = json['type'];
  }
  int? id;
  int? brandId;
  String? title;
  String? img;
  int? categoryBrandId;
  int? sort;
  String? type;



}