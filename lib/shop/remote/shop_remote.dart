



import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:get_storage/get_storage.dart';

import '../model/shop_model.dart';

class ShopRemote{

  static Future<ShopModel?> fetchshop() async{

    var url = Uri.http('sanatabzar128.ir', 'v2/vip-category');
    var response = await http.post(url,
        body:
        {
          'token':GetStorage().read('mytoken'),
          'per_param': '10','page_param': '1'
        });
    //
    // Response response;
    // var dio= Dio();
    // response = await dio.post('http://sanatabzar128.ir/v2/vip-category',
    //     data: {
    //   'token':GetStorage().read('mytoken'),
    //       'per_param': '10','page_param': '1'
    // });


    try{
      if (response.statusCode == 200) {

        var jsonResponse =ShopModel.fromJson(convert.jsonDecode(response.body));
        return jsonResponse;
        // return ShopModel.fromJson(response.data);

      }

      else  {


        return null;
      }
    }catch(e){

      return null;

    }


  }
}