



import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:get_storage/get_storage.dart';

import '../../core/constants.dart';

class submitFavoriteRemote{

  static Future<bool?> fetchfavorite(String IdValue) async{


    var url = Uri.http('sanatabzar128.ir', 'v2/submitfavorite');
    var response = await http.post(url,
        body:
        {
          'token':Token,
          'type_fav': 'places',
          'id_value': IdValue,
        });
    // Response response;
    // var dio= Dio();
    // response = await dio.post('http://sanatabzar128.ir/v2/submitfavorite',
    //     data: {
    //       'token':GetStorage().read('mytoken'),
    //       'type_fav': 'places',
    //       'id_value': IdValue,
    // });


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