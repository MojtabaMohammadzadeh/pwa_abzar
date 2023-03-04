class NewsModel {
  NewsModel({
      this.id, 
      this.title, 
      this.description, 
      this.createdAt, 
      this.updatedAt,});

  NewsModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;



}