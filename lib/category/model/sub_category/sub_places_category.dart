









import 'list_sliders.dart';

class subPlacescategory {
  subPlacescategory({
    this.id,
    this.title,
    this.img,
    this.list_sliders,});

  subPlacescategory.fromJson(dynamic json) {

    id = json['id'];
    title = json['title'];
    img = json['img'];
    if (json['list_sliders'] != null) {
      list_sliders = [];
      json['list_sliders'].forEach((v) {
        list_sliders?.add(ListSliders.fromJson(v));
      });

    }
  }


  int? id;
  String? title;
  String? img;
  List<ListSliders>? list_sliders;



}