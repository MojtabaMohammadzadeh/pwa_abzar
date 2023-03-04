




import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:get_storage/get_storage.dart';

import '../model/user_profile_model.dart';

class UserRemote{

  static Future<ProfileModel?> fetchUser(String myToken) async{

    var url = Uri.http('sanatabzar128.ir', 'v2/userprofile');
    var response = await http.post(url,
        body:
        {
          'token':GetStorage().read('mytoken'),
        });

    // Response response;
    // var dio= Dio();
    // response = await dio.post('http://sanatabzar128.ir/v2/userprofile',
    //     data: {
    //   'token':GetStorage().read('mytoken'),
    //       });


    try{
      if (response.statusCode == 200) {
        var jsonResponse =ProfileModel.fromJson(convert.jsonDecode(response.body));
        return jsonResponse;
        // return ProfileModel.fromJson(response.data);

      }

      else  {

        return null;
      }
    }catch(e){

      return null;

    }


  }
}