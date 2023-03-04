class VipProducts {
  VipProducts({
      this.id, 
      this.title, 
      this.description, 
      this.img, 
      this.price, 
      this.quantity, 
      this.isAvailable, 
      this.sort, 
      this.type,
      this.numOfShop = 0,
  });

  VipProducts.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    img = json['img'];
    price = json['price'];
    quantity = json['quantity'];
    isAvailable = json['is_available'];
    sort = json['sort'];
    type = json['type'];
    numOfShop = 0;
  }
  int? id;
  String? title;
  String? description;
  String? img;
  String? price;
  int? quantity;
  bool? isAvailable;
  int? sort;
  String? type;
  int? numOfShop;


}