





import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:get_storage/get_storage.dart';

import '../model/complete_shoping/Complete_shoping.dart';

class CompleteShopingRemote{




  static Future<CompleteShoping?> fetchShopUrl(String addressId) async{



    var url = Uri.http('sanatabzar128.ir', 'v1/shop/complete-shopping-cart');
    var response = await http.post(url,
        body:
        {
          'token':GetStorage().read('mytoken'),
          'per_param': '10',
          'page_param': '1',
          'address_id' : addressId,
        });
    // Response response;
    // var dio= Dio();
    // response = await dio.post('http://sanatabzar128.ir/v1/shop/complete-shopping-cart',
    //     data: {
    //   'token':GetStorage().read('mytoken'),
    //       'per_param': '10',
    //       'page_param': '1',
    //       'address_id' : addressId,
    //     });

    try{
      if (response.statusCode == 200) {
        var jsonResponse =CompleteShoping.fromJson(convert.jsonDecode(response.body));
        return jsonResponse;
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