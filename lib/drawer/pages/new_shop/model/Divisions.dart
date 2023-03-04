class Divisions {
  Divisions({
      this.id, 
      this.name,});

  Divisions.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;



}