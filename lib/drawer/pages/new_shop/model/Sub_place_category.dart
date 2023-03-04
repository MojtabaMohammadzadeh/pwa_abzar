class SubPlaceCategory {
  SubPlaceCategory({
      this.id, 
      this.parentId, 
      this.title, 
      this.type, 
      this.sort, 
      this.img, 
      this.isDelete,});

  SubPlaceCategory.fromJson(dynamic json) {
    id = json['id'];
    parentId = json['parent_id'];
    title = json['title'];
    type = json['type'];
    sort = json['sort'];
    img = json['img'];
    isDelete = json['is_delete'];
  }
  int? id;
  int? parentId;
  String? title;
  String? type;
  int? sort;
  String? img;
  int? isDelete;



}