class LastPrice {
  LastPrice({
      this.name, 
      this.price,});

  LastPrice.fromJson(dynamic json) {
    name = json['name'];
    price = json['price'];
  }
  String? name;
  int? price;



}