class UserEditModel {
  UserEditModel({
      this.success, 
      this.error, 
      this.errorCode, 
      this.msg,});

  UserEditModel.fromJson(dynamic json) {
    success = json['success'];
    error = json['error'];
    errorCode = json['error_code'];
    msg = json['msg'];
  }
  int? success;
  int? error;
  int? errorCode;
  String? msg;



}