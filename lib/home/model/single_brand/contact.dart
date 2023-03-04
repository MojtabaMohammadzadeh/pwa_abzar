

class Contact{

  Contact({
    this.phone,
    this.fax,
    this.insta,
    this.sms
});


  Contact.fromJson(dynamic json){
    phone = json['phone'];
    fax = json['fax'];
    insta = json['insta'];
    sms = json['sms'];

  }




  String? phone;
  String? fax;
  String? sms;
  String? insta;


}