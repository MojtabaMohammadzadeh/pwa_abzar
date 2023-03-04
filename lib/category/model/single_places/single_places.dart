

class SinglePlace {
  SinglePlace({
    this.id,
    this.title,
    this.phone,
    this.address,
    this.description,
    this.titleCategory,
    this.favorite,});

  SinglePlace.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    phone = json['phone'];
    address = json['address'];
    description = json['description'];
    titleCategory = json['title_category'];

  }
  int? id;
  String? title;
  String? phone;
  String? address;
  String? description;
  String? titleCategory;
  int? favorite;



}