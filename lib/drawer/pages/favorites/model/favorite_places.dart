class FavoritePlaces {
  FavoritePlaces({
      this.id,
      this.title,
      this.description,
      this.img,});

  FavoritePlaces.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    img = json['img'];
  }
  int? id;
  String? title;
  String? description;
  String? img;



}