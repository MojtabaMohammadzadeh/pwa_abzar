

class AllBrands {
  AllBrands({
    this.id,
    this.name,
    this.img,
    this.sort,
    this.status,
    this.category_brand_id,
    this.is_delete,});

  AllBrands.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    sort = json['sort'];
    status = json['status'];
    category_brand_id = json['category_brand_id'];
    is_delete = json['is_delete'];
  }
  int? id;
  String? name;
  String? img;
  int? sort;
  int? status;
  int? category_brand_id;
  int? is_delete;



}