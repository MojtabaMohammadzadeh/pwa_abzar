




import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:get_storage/get_storage.dart';

import '../model/cart_items/Cart_items.dart';
import '../model/cart_items/ShopCart.dart';



class ShopCartRemote{

  static Future<CartItems?> fetchshopCart() async{

    var url = Uri.http('sanatabzar128.ir', 'v1/shop/get-cart-items');
    var response = await http.post(url,
        body:
        {
          'token':GetStorage().read('mytoken'),
          'per_param': '10',
          'page_param': '1'
        });


    // Response response;
    // var dio= Dio();
    // response = await dio.post('http://sanatabzar128.ir/v1/shop/get-cart-items',
    //     data: {
    //   'token':GetStorage().read('mytoken'),
    //       'per_param': '10',
    //       'page_param': '1'
    //
    // });



    try{
      if (response.statusCode == 200) {


        var jsonResponse =CartItems.fromJson(convert.jsonDecode(response.body));
        return jsonResponse;

        // return CartItems.fromJson(response.data);

      }

      else  {


        return null;
      }
    }catch(e){

      return null;

    }


  }
}