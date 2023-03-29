




import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:get_storage/get_storage.dart';

import '../../../../core/constants.dart';

class NewAdressRemote{

  static Future<bool?> fetchNewAddress(String PostalCode,String Address) async{


    var url = Uri.http('sanatabzar128.ir', 'v2/store-address');
    var response = await http.post(url,
        body:
        {
          'token':Token,
          'per_param': '10',
          'page_param': '1',
          'postal_code': PostalCode,
          'address' : Address,
        });

    // Response response;
    // var dio= Dio();
    // response = await dio.post('http://sanatabzar128.ir/v2/store-address',
    //     data: {
    //       'token':GetStorage().read('mytoken'),
    //       'per_param': '10',
    //       'page_param': '1',
    //       'postal_code': PostalCode,
    //       'address' : Address,
    //
    //
    // });



    try{
      if (response.statusCode == 200) {

        return true;
      }

      else  {

        print('heeeeeeeeeeeeeeeeeeeelppppp');
        return null;
      }
    }catch(e){
      print('hooooooooooooooooooooooooooooo');
      print(e);
      return null;

    }


  }
}