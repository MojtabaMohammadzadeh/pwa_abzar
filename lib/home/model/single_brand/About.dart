


class About{
  About({
    this.title,
    this.body,
});

  About.fromJson(dynamic json){

    title = json['title'];
    body = json['body'];

  }



  String? title;
  String? body;
}