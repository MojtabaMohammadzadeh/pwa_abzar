


import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:get_storage/get_storage.dart';

import '../../core/constants.dart';
import '../model/single_brand/single_brand_model.dart';

class SingleBrandRemote {

  static Future<SingleBrandModel?> fetchSingleBrand(String idBrand) async{

    var url = Uri.http('sanatabzar128.ir', 'v2/singlebrand');
    var response = await http.post(url,
        body:
        {
          'token': Token,
          'page_param': '1',
          'per_param': '10',
          'id_brand': idBrand
        });

    // Response response;
    // var dio= Dio();
    // response = await dio.post('http://sanatabzar128.ir/v2/singlebrand',
    //     data: {
    //   'token': GetStorage().read('mytoken'),
    //       'page_param': '1',
    //     'per_param': '10',
    //       'id_brand': idBrand
    //
    // });

    try{
      if (response.statusCode == 200) {

        var jsonResponse =SingleBrandModel.fromJson(convert.jsonDecode(response.body));
        return jsonResponse;
        // return SingleBrandModel.fromJson(response.data);

      }

      else  {


        return null;
      }
    }catch(e){

      return null;

    }
  }
}
