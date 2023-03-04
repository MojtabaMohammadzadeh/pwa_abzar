class Cities {
  Cities({
      this.id, 
      this.name, 
      this.codeCity, 
      this.idDivision, 
      this.createdAt, 
      this.updatedAt,});

  Cities.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    codeCity = json['code_city'];
    idDivision = json['id_division'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? codeCity;
  int? idDivision;
  String? createdAt;
  String? updatedAt;



}