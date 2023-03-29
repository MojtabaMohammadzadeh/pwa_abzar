






import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:get_storage/get_storage.dart';

import '../../core/constants.dart';
import '../model/search_model/Search_model.dart';

class SearchRemote{

  static Future<SearchModel?> fetchSearch(String searchType, String Value) async{

    var url = Uri.http('sanatabzar128.ir', 'v2/finde');
    var response = await http.post(url,
        body:
        {

          'token':Token,
          'value': Value,
          'search_type': searchType,
          'per_param': 10,
          'page_param':1,
        });

    // Response response;
    // var dio= Dio();
    // response = await dio.post('http://sanatabzar128.ir/v2/finde',
    //     data: {
    //   'token':GetStorage().read('mytoken'),
    //       'value': Value,
    //       'search_type': searchType,
    //       'per_param': 10,
    //       'page_param':1,
    //     });


    try{
      if (response.statusCode == 200) {
        var jsonResponse =SearchModel.fromJson(convert.jsonDecode(response.body));
        return jsonResponse;
               // return SearchModel.fromJson(response.data);

      }

      else  {


        return null;
      }
    }catch(e){

      return null;

    }


  }
}