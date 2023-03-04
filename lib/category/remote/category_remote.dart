





import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../model/all_category_model.dart';

class CategoryRemote{

  static Future<AllCategoryModel?> fetchCategory() async{


    var url = Uri.http('sanatabzar128.ir', 'v2/allcategoryplaces');
    var response = await http.post(url,
        body:
        {

          'page_param': '1',
          'per_param':'10',
          });



    try{
      if (response.statusCode == 200) {


        var jsonResponse =AllCategoryModel.fromJson(convert.jsonDecode(response.body));
        return jsonResponse;

      }

      else  {


        return null;
      }
    }catch(e){

      return null;

    }


  }
}