




import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:get_storage/get_storage.dart';

import '../../../../core/constants.dart';

class SubmitRemote{


  static Future<bool?> Submit(
      String slider,
      String id_place,
      String title,
      String type_place,
      String id_sub_category,
      String description,
      String phone,
      String address,
      String city,
      ) async{


    var url = Uri.http('sanatabzar128.ir', 'v2/submitplace');
    var response = await http.post(url,
        body:
        {
          'token':Token,
          'device_id': '2cd05a4743776040',
          'slider': slider,
          'id_place': id_place,
          'title' : title,
          'type_place' : type_place,
          'id_sub_category' : id_sub_category,
          'description' : description,
          'phone' : phone,
          'address' : address,
          'city' : city,
        });

    // Response response;
    // var dio= Dio();
    // response = await dio.post('http://sanatabzar128.ir/v2/submitplace',
    //     data: {
    //   'token':GetStorage().read('mytoken'),
    //       'device_id': '2cd05a4743776040',
    //       'slider': slider,
    //       'id_place': id_place,
    //       'title' : title,
    //       'type_place' : type_place,
    //       'id_sub_category' : id_sub_category,
    //       'description' : description,
    //       'phone' : phone,
    //       'address' : address,
    //       'city' : city,
    //
    //     });


    try{
      if (response.statusCode == 200) {


        return true;

      }

      else  {


        return null;
      }
    }catch(e){

      return null;

    }


  }


}