

class ListSliders {
  ListSliders({
    this.id,
    this.name,
    this.type,
    this.img,
    this.value,
    this.action_type,
    this.location,
    this.category_brand_id,
    this.id_value,


  });

  ListSliders.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    img = json['img'];
    value = json['value'];
    action_type = json['action_type'];
    location = json['location'];
    category_brand_id = json['category_brand_id'];
    id_value = json['id_value'];


  }
  int? id;
  String? name;
  String? type;
  String? img;
  String? value;
  String? action_type;
  String? location;
  int? category_brand_id;
  int? id_value;

}