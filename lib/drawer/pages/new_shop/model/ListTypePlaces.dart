class ListTypePlaces {
  ListTypePlaces({
      this.id, 
      this.name, 
      this.title,});

  ListTypePlaces.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
  }
  int? id;
  String? name;
  String? title;



}