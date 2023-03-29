




import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:get_storage/get_storage.dart';
import '../../core/constants.dart';
import '../model/first_page_model.dart';

class HomeRemote{

  static Future<FirstPageModel?> fetchHome(String myToken) async{

    var url = Uri.http('sanatabzar128.ir', 'v2/firstpage');
    var response = await http.post(url,
        body:
        {
          'token':Token,
          'device_id': '2cd05a4743776040',
          'device_name': 'saaaaaaaaa',
          'vandroid': '11',
          'push_token': '',
        });


    // Response response;
    // var dio= Dio();
    //
    // response = await dio.post('http://sanatabzar128.ir/v2/firstpage',
    //     data: {
    //   'token':GetStorage().read('mytoken'),
    //       'device_id': '2cd05a4743776040',
    //       'device_name': 'saaaaaaaaa',
    //       'vandroid': '11',
    //       'push_token': '',
    //     });


    try{
      if (response.statusCode == 200) {

        var jsonResponse =FirstPageModel.fromJson(convert.jsonDecode(response.body));
        return jsonResponse;
        // return FirstPageModel.fromJson(response.data);

      }

      else  {


        return null;
      }
    }catch(e){

      return null;

    }


  }
}