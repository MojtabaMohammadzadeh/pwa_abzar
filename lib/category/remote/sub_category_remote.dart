



import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../model/sub_category/sub_category_model.dart';

class SubCategoryRemote{


  static Future<SubCategoryModel?> fetchSubCategory(String id_category) async{

    var url = Uri.http('sanatabzar128.ir', 'v2/allsubcategoryplaces');
    var response = await http.post(url,
        body:
        {
          'page_param': '1',
          'per_param': '10',
          'id_category': id_category,
        });

    // Response response;
    // var dio= Dio();

    // response = await dio.post('http://sanatabzar128.ir/v2/allsubcategoryplaces',
    //     data: {
    //       'page_param': '1',
    //       'per_param': '10',
    //       'id_category': id_category,
    //       });

    try{
      if (response.statusCode == 200) {

        var jsonResponse =SubCategoryModel.fromJson(convert.jsonDecode(response.body));
        return jsonResponse;
        // return SubCategoryModel.fromJson(response.data);

      }

      else  {


        return null;
      }
    }catch(e){

      return null;

    }

  }
}