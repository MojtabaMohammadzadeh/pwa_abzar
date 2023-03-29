


import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:get_storage/get_storage.dart';

import '../../../../core/constants.dart';
import '../model/new_shop_list/New_shop_lists.dart';

class ShopListsRemote{

  static Future<NewShopLists?> getShopList() async{

    var url = Uri.http('sanatabzar128.ir', 'v2/listplacescategory');
    var response = await http.post(url,
        body:
        {

          'token':Token,
          'device_id': '2cd05a4743776040',
          'page_param': '1',
          'per_param' : '10',
          'type' : 'my',
        });

    // Response response;
    // var dio= Dio();
    // response = await dio.post('http://sanatabzar128.ir/v2/listplacescategory',
    //     data: {
    //   'token':GetStorage().read('mytoken'),
    //       'device_id': '2cd05a4743776040',
    //       'page_param': '1',
    //       'per_param' : '10',
    //       'type' : 'my',
    //
    //     });


    try{
      if (response.statusCode == 200) {

        var jsonResponse =NewShopLists.fromJson(convert.jsonDecode(response.body));
        return jsonResponse;
        // return NewShopLists.fromJson(response.data);

      }

      else  {


        return null;
      }
    }catch(e){


      return null;

    }


  }


}