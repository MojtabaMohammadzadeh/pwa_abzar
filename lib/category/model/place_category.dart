





class Placescategory {
  Placescategory({
    required this.id,
    required this.title,
    required this.img,});

  Placescategory.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    img = json['img'];
  }
  int? id;
  String? title;
  String? img;



}