class OrdersData {
  OrdersData({
      this.id, 
      this.title, 
      this.statusPayment, 
      this.statusDelivery, 
      this.messageDelivery, 
      this.price, 
      this.authority, 
      this.createdAt, 
      this.address, 
      this.postalCode,});

  OrdersData.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    statusPayment = json['status_payment'];
    statusDelivery = json['status_delivery'];
    messageDelivery = json['message_delivery'];
    price = json['price'];
    authority = json['authority'];
    createdAt = json['created_at'];
    address = json['address'];
    postalCode = json['postal_code'];
  }
  int? id;
  String? title;
  int? statusPayment;
  int? statusDelivery;
  String? messageDelivery;
  String? price;
  String? authority;
  String? createdAt;
  String? address;
  String? postalCode;



}