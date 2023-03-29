





import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:get_storage/get_storage.dart';

import '../../../../core/constants.dart';
import '../model/Ordersmodel.dart';


class OrderRemote{

  static Future<Ordersmodel?> fetchOrder() async{


    var url = Uri.http('sanatabzar128.ir', 'v2/orders');
    var response = await http.post(url,
        body:
        {
          'token':Token,
          'page_param': '1',
          'per_param':'10',
        });
    // Response response;
    // var dio= Dio();
    // response = await dio.post('http://sanatabzar128.ir/v2/orders',
    //     data: {
    //       'token':GetStorage().read('mytoken'),
    //
    //       'page_param': '1',
    //       'per_param': '10',
    //     });


    try{
      if (response.statusCode == 201) {
        var jsonResponse =Ordersmodel.fromJson(convert.jsonDecode(response.body));
        return jsonResponse;
        // return Ordersmodel.fromJson(response.data);
      }

      else  {

        return null;
      }
    }catch(e){

      return null;
    }


  }
}