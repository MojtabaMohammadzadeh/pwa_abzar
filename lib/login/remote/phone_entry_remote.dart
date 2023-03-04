





import 'package:http/http.dart' as http;

import '../model/phone_entry_model.dart';

class SendPhoneRemote {


  static Future<SendPhoneResponse?> sendPhoneNumber(String phoneNumber) async {
    var url = Uri.http('sanatabzar128.ir', 'v2/sendcode');
    var response = await http.post(url,
        body:
        {
          'phone_number':phoneNumber,'ios': ''
        });

    // Response response;
    // var dio= Dio();
    // response = await dio.post('http://sanatabzar128.ir/v2/sendcode',data: {'phone_number':phoneNumber,'ios': ''});


  }

}