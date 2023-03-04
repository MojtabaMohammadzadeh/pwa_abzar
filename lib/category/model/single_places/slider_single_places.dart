


class  SliderSinglePlace {
  SliderSinglePlace({
    this.id,
    this.name,
    this.type,
    this.img,
    this.value,
    this.actionType,
    this.location,
    this.idValue,});

  SliderSinglePlace.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    img = json['img'];
    value = json['value'];
    actionType = json['action_type'];
    location = json['location'];
    idValue = json['id_value'];
  }
  int? id;
  String? name;
  String? type;
  String? img;
  String? value;
  String? actionType;
  String? location;
  int? idValue;



}