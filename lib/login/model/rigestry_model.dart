


class RigesterCodeModel {
  RigesterCodeModel({
    required this.success,
    required this.error,
    required this.error_code,
    required this.msg,
    required this.success_code,
    required this.token,
    required this.name,
    required this.family,
    required this.img,
    required this.code_reagents,
  });

  factory RigesterCodeModel.fromJson(dynamic json) {
    return RigesterCodeModel(
      success : json['success'] ?? 0,
      error : json['error'] ?? 0,
      error_code : json['error_code'] ?? 0,
      msg : json['msg'] ?? 'nothing',
      success_code: json['success_code'] ?? 0,
      token: json['token'] ?? '0',
      name: json['name'] ?? 'not',
      family: json['family'] ?? 'not',
      img : json['img'] ?? 'not',
      code_reagents: json['code_reagents'] ?? 0,
    );
  }
  int? success;
  int? error;
  int? error_code;
  String? msg;
  int? success_code;
  String? token;
  String? name;
  String? family;
  String? img;
  int? code_reagents;



}