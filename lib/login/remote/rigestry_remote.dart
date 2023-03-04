


import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../model/rigestry_model.dart';


class RigesterCodeRemote {

  static Future<RigesterCodeModel?> sendRigesterCode(String phoneNumber, String Code) async{
    String defaultCountryCode = "+98";

    if(phoneNumber.startsWith("0"))
    {
      phoneNumber = phoneNumber.replaceFirst("0", "$defaultCountryCode");
    }
    var url = Uri.http('sanatabzar128.ir', 'v2/checkcode');
    var response = await http.post(url,
        body:
        {
          'code': Code,
          'phone_number': phoneNumber,
          'type_device': 'android',
          'device_id': '""',
          'device_name': '""'
        });


    // Response response;
    // var dio= Dio();
    //
    //
    // response = await dio.post('http://sanatabzar128.ir/v2/checkcode',
    //     data: {
    //   'code': Code,
    //   'phone_number': phoneNumber,
    //   'type_device': 'android',
    //   'device_id': '""',
    //   'device_name': '""'
    // });




    try{
      if (response.statusCode == 200) {

        var jsonResponse =RigesterCodeModel.fromJson(convert.jsonDecode(response.body));
        return jsonResponse;

        // return RigesterCodeModel.fromJson(response.data);

      }

      else {


        return null;
      }
    }catch(e){

      return null;

    }
  }
}