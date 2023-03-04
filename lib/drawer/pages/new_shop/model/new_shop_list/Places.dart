import 'Slider.dart';

class Places {
  Places({
      this.id, 
      this.title, 
      this.description, 
      this.status, 
      this.city, 
      this.address, 
      this.phone,
      this.idCategory,
      this.img, 
      this.slider, 
      this.division, 
      this.category,});

  Places.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    city = json['city'];
    address = json['address'];
    phone = json['phone'];
    idCategory = json['id_category'];
    img = json['img'];
    if (json['slider'] != null) {
      slider = [];
      json['slider'].forEach((v) {
        slider?.add(SliderofShopList.fromJson(v));
      });
    }
    division = json['division'];
    category = json['category'];
  }
  int? id;
  String? title;
  String? description;
  int? status;
  String? city;
  String? address;
  String? phone;
  int? idCategory;
  String? img;
  List<SliderofShopList>? slider;
  String? division;
  String? category;


}