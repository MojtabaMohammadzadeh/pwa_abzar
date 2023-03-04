



import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:get_storage/get_storage.dart';

import '../model/messages/All_messages.dart';

class MessageRemote{

  static Future<AllMessages?> fetchMessage() async{

    var url = Uri.http('sanatabzar128.ir', 'v2/allmessage');
    var response = await http.post(url,
        body:
        {
          'token':GetStorage().read('mytoken'),
          'device_id': '2cd05a4743776040',
          'per_param' : '1',
          'page_param' : '10',
        });

    // Response response;
    // var dio= Dio();
    // response = await dio.post('http://sanatabzar128.ir/v2/allmessage',
    //     data: {
    //   'token':GetStorage().read('mytoken'),
    //       'device_id': '2cd05a4743776040',
    //       'per_param' : '1',
    //       'page_param' : '10',
    //
    //     });


    try{
      if (response.statusCode == 200) {
        var jsonResponse =AllMessages.fromJson(convert.jsonDecode(response.body));
        return jsonResponse;
        // return AllMessages.fromJson(response.data);

      }

      else  {


        return null;
      }
    }catch(e){

      return null;

    }


  }


}