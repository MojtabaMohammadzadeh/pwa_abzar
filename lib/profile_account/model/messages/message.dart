class Message {
  Message({
      this.id, 
      this.title, 
      this.content, 
      this.createdAt, 
      this.special, 
      this.status, 
      this.createdAt2, 
      this.countUnread, 
      this.time,});

  Message.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    createdAt = json['created_at'];
    special = json['special'];
    status = json['status'];
    createdAt2 = json['created_at2'];
    countUnread = json['count_unread'];
    time = json['time'];
  }
  int? id;
  String? title;
  String? content;
  String? createdAt;
  int? special;
  int? status;
  String? createdAt2;
  int? countUnread;
  String? time;



}