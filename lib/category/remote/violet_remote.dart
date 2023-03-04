




import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:get_storage/get_storage.dart';

class VioletRemote{

  static Future<bool?> fetchviolet(String productId) async{

    var url = Uri.http('sanatabzar128.ir', 'v2/vip-product-single-alert');
    var response = await http.post(url,
        body:
        {
          'token':GetStorage().read('mytoken'),
          'vip_product_id': productId
        });

    // Response response;
    // var dio= Dio();
    // response = await dio.post('http://sanatabzar128.ir/v2/vip-product-single-alert',
    //     data: {
    //     'token':GetStorage().read('mytoken'),
    //       'vip_product_id': productId
    //
    //       });


    try{
      if (response.statusCode == 200) {


        return true;

      }

      else  {


        return false;
      }
    }catch(e){

      return null;

    }


  }
}