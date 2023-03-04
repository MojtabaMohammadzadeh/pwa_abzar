class SingleBrand {
  SingleBrand({
    this.id,
    this.name,
    this.img,
    this.sort,
    this.status,
    this.categoryBrandId,
    this.isDelete,
    this.countShow,});

  SingleBrand.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    sort = json['sort'];
    status = json['status'];
    categoryBrandId = json['category_brand_id'];
    isDelete = json['is_delete'];
    countShow = json['count_show'];
  }
  int? id;
  String? name;
  String? img;
  int? sort;
  int? status;
  int? categoryBrandId;
  int? isDelete;
  int? countShow;



}