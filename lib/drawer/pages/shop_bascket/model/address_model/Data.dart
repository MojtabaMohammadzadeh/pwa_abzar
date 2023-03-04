class addressData {
  addressData({
      required this.id,
      required this.address,
      required this.postalCode,});

  addressData.fromJson(dynamic json) {
    id = json['id'];
    address = json['address'];
    postalCode = json['postal_code'];
  }
   int? id;
   String? address;
   String? postalCode;



}