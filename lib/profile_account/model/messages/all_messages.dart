import 'message.dart';

class AllMessages {
  AllMessages({
       this.success,
       this.error,
       this.errorCode,
       this.msg,
       this.message,});

  factory AllMessages.fromJson(dynamic json) {

    List<Message> message = [];
    if (json['message'] != null) {

      json['message'].forEach((v) {
        message.add(Message.fromJson(v));
      });
    }
    return AllMessages(
        success : json['success'],
        error :  json['error'],
        errorCode : json['error_code'],
        msg : json['msg'],
        message : message,
    );
  }
  int? success;
  int? error;
  int? errorCode;
  String? msg;
  List<Message>? message;



}