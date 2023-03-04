


import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:get_storage/get_storage.dart';

import '../../drawer/pages/shop_bascket/model/cart_items/Cart_items.dart';

class UpdateShopCart{

  static Future<CartItems?> fetchshopdetails(String productID) async{


    var url = Uri.http('sanatabzar128.ir', 'v1/shop/update-cart');
    var response = await http.post(url,
        body:
        {
          'token':GetStorage().read('mytoken'),
          'per_param': '10',
          'page_param': '1',
          'action' : 'addToCart',
          'product_id' :productID,
        });
    // Response response;
    // var dio= Dio();
    // response = await dio.post('http://sanatabzar128.ir/v1/shop/update-cart',
    //     data: {
    //   'token':GetStorage().read('mytoken'),
    //       'per_param': '10',
    //       'page_param': '1',
    //       'action' : 'addToCart',
    //       'product_id' :productID,
    //
    //     });


    try{
      if (response.statusCode == 200) {

        var jsonResponse =CartItems.fromJson(convert.jsonDecode(response.body));
        return jsonResponse;
        // return  CartItems.fromJson(response.data);

      }

      else  {


        return null;
      }
    }catch(e){

      return null;

    }


  }



  static Future<CartItems?> dropshopListitem(String productID) async{

    var url = Uri.http('sanatabzar128.ir', 'v1/shop/update-cart');
    var response = await http.post(url,
        body:
        {
          'token':GetStorage().read('mytoken'),
          'per_param': '10',
          'page_param': '1',
          'action' : 'dropByCart',
          'product_id' :productID,
        });

    // Response response;
    // var dio= Dio();
    //
    // response = await dio.post('http://sanatabzar128.ir/v1/shop/update-cart',
    //     data: {'token':GetStorage().read('mytoken'),
    //       'per_param': '10',
    //       'page_param': '1',
    //       'action' : 'dropByCart',
    //       'product_id' :productID,
    //
    //     });


    try{
      if (response.statusCode == 200) {

        var jsonResponse =CartItems.fromJson(convert.jsonDecode(response.body));
        return jsonResponse;
        // return  CartItems.fromJson(response.data);;

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


  static Future<CartItems?> removeShopCart(String CartId) async{

    var url = Uri.http('sanatabzar128.ir', 'v1/shop/remove-cart-item');
    var response = await http.post(url,
        body:
        {
          'token':GetStorage().read('mytoken'),
          'per_param': '10',
          'page_param': '1',
          'cart_item_id' :CartId,
        });

    // Response response;
    // var dio= Dio();
    // response = await dio.post('http://sanatabzar128.ir/v1/shop/remove-cart-item',
    //     data: {'token':GetStorage().read('mytoken'),
    //       'per_param': '10',
    //       'page_param': '1',
    //
    //       'cart_item_id' :CartId,
    //
    //     });


    try{
      if (response.statusCode == 200) {

        var jsonResponse =CartItems.fromJson(convert.jsonDecode(response.body));
        return jsonResponse;
        // return  CartItems.fromJson(response.data);;

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