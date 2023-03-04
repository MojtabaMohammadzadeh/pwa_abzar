class Products {
  Products({
    required this.id,
    required this.title,
    required this.content,
    required this.img,
    required this.price,
    });

  factory Products.fromJson(dynamic json) {

    return Products(
      id : json['id'],
      title : json['title'],
      content : json['content'],
      img : json['img'],
      price : json['price']
    );
  }
  int id;
  String title;
  String content;
  String img;
  int price;



}