class SliderModel {
  SliderModel({
      required this.success,
      required this.error,
      required this.errorCode,
      required this.msg,
      required this.pathfile,});

  factory SliderModel.fromJson(dynamic json) {

    return SliderModel(
        success : json['success'],
        error : json['error'],
        errorCode : json['error_code'],
    msg : json['msg'],
    pathfile : json['pathfile'],
    );
  }
  int success;
  int error;
  int errorCode;
  String msg;
  String pathfile;



}