class CompleteShoping {
  CompleteShoping({
      this.success, 
      this.error, 
      this.errorCode, 
      this.msg, 
      this.url,});

  CompleteShoping.fromJson(dynamic json) {
    success = json['success'];
    error = json['error'];
    errorCode = json['error_code'];
    msg = json['msg'];
    url = json['url'];
  }
  int? success;
  int? error;
  int? errorCode;
  String? msg;
  String? url;



}