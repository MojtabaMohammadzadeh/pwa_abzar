

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:get_storage/get_storage.dart';

import '../../core/constants.dart';
import '../model/single_places/single_place_model.dart';

class SinglePlaceRemote{


  static Future<SinglePlaceModel?> fetchSinglePlace(String id_value) async{

    var url = Uri.http('sanatabzar128.ir', 'v2/singleplaces');
    var response = await http.post(url,
        body:
        {
          'token': Token,
          'page_param': '1',
          'per_param': '10',
           'id_place': id_value
        });


    try{
      if (response.statusCode == 200) {

        var jsonResponse =SinglePlaceModel.fromJson(convert.jsonDecode(response.body));



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