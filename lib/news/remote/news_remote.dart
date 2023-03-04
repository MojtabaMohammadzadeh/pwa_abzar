





import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../model/News_model.dart';



class NewsRemote{

  static Future<List<NewsModel>?> fetchNews() async{

    var url = Uri.http('sanatabzar128.ir', 'v2/news');
    var response = await http.post(url,
        body:
        {
          'page_param': '1',
          'per_param':'10',
        });

    // Response response;
    // var dio= Dio();
    // response = await dio.post('http://sanatabzar128.ir/v2/news', data: {'page_param': '1','per_param': '10'});



    try{
      if (response.statusCode == 200) {
        

        // return response.body.map<NewsModel>(NewsModel.fromJson).toList();

      }

      else  {


        return null;
      }
    }catch(e){

      return null;

    }


  }
}



