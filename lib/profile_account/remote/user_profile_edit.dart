




import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:get_storage/get_storage.dart';


import '../model/user_edit/User_edit_model.dart';

class UpdateUser{

  static Future<UserEditModel?> fetchUser(String Name, String Family) async{

    var url = Uri.http('sanatabzar128.ir', 'v2/updateuser');
    var response = await http.post(url,
        body:
        {
          'token':GetStorage().read('mytoken'),
          'name' : Name,
          'family' : Family,
        });
    // Response response;
    // var dio= Dio();
    // response = await dio.post('http://sanatabzar128.ir/v2/updateuser',
    //     data: {
    //   'token':GetStorage().read('mytoken'),
    //       'name' : Name,
    //       'family' : Family,
    //     });

    try{
      if (response.statusCode == 200) {

        var jsonResponse =UserEditModel.fromJson(convert.jsonDecode(response.body));
        return jsonResponse;
        // return UserEditModel.fromJson(response.data);
      }
      else  {

        return null;
      }
    }catch(e){

      return null;
    }
  }





}