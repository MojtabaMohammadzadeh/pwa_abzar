// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));



class ProfileModel {
  ProfileModel({
    this.success,
    this.error,
    this.errorCode,
    this.msg,
    required this.userDetail,
  });

  int? success;
  int? error;
  int? errorCode;
  String? msg;
  UserDetail userDetail;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    success: json["success"],
    error: json["error"],
    errorCode: json["error_code"],
    msg: json["msg"],
    userDetail: UserDetail.fromJson(json["user_detail"]),
  );


}

class UserDetail {
  UserDetail({
    this.id,
    this.name,
    this.family,
    this.phoneNumber,
    this.img,
    this.codeReagents,
  });

  int? id;
  String? name;
  String? family;
  String? phoneNumber;
  String? img;
  int? codeReagents;

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
    id: json["id"],
    name: json["name"],
    family: json["family"],
    phoneNumber: json["phone_number"],
    img: json["img"],
    codeReagents: json["code_reagents"],
  );


}
