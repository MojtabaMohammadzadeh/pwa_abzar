
class LastPrices {
  LastPrices({
    this.name,
    this.price,});

  LastPrices.fromJson(dynamic json) {
    name = json['name'];
    price = json['price'];
  }
  String? name;
  String? price;



}