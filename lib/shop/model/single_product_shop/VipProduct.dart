class VipProductSingle {
  VipProductSingle({
      this.id, 
      this.title, 
      this.quantity, 
      this.description, 
      this.vipCategoryId, 
      this.price, 
      this.sort, 
      this.status, 
      this.isAvailable, 
      this.img, 
      this.deletedAt, 
      this.createdAt, 
      this.updatedAt,});

  VipProductSingle.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    quantity = json['quantity'];
    description = json['description'];
    vipCategoryId = json['vip_category_id'];
    price = json['price'];
    sort = json['sort'];
    status = json['status'];
    isAvailable = json['is_available'];
    img = json['img'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? title;
  int? quantity;
  String? description;
  int? vipCategoryId;
  String? price;
  int? sort;
  int? status;
  bool? isAvailable;
  String? img;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;



}