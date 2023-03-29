




import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:get_storage/get_storage.dart';

import '../../core/constants.dart';
import '../model/single_product_shop/Single_shop_products.dart';

class SingleProShopRemote{

  static Future<SingleShopProducts?> fetchshopPro(String productId) async{


    var url = Uri.http('sanatabzar128.ir', 'v2/vip-product-single');
    var response = await http.post(url,
        body:
        {
          'token':Token,
          'vip_product_id': productId,
        });
    // Response response;
    // var dio= Dio();
    // response = await dio.post('http://sanatabzar128.ir/v2/vip-product-single',
    //     data: {
    //       'token':GetStorage().read('mytoken'),
    //       'vip_product_id': productId,
    //
    //     });


    try{
      if (response.statusCode == 200) {

        var jsonResponse =SingleShopProducts.fromJson(convert.jsonDecode(response.body));
        return jsonResponse;
        // return SingleShopProducts.fromJson(response.data);

      }

      else  {


        return null;
      }
    }catch(e){

      return null;

    }


  }
}