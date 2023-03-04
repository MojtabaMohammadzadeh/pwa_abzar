class ProductShopCart {
  ProductShopCart({
      this.id, 
      this.title, 
      this.price, 
      this.img, 
      this.quantity, 
      this.isAvailable,});

  ProductShopCart.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    isAvailable = json['is_available'];
  }
  int? id;
  String? title;
  String? price;
  String? img;
  int? quantity;
  bool? isAvailable;



}