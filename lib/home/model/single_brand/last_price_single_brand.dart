class LastPriceSingleBrand {
  LastPriceSingleBrand ({
    this.id,
    this.name,
    this.price,});

  LastPriceSingleBrand .fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
  }
  int? id;
  String? name;
  int? price;



}