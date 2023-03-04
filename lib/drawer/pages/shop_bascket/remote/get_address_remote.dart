



import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:get_storage/get_storage.dart';

import '../model/address_model/Address_model.dart';

class AdressRemote{

  static Future<AddressModel?> fetchAddress() async{


    var url = Uri.http('sanatabzar128.ir', 'v2/addresses');
    var response = await http.post(url,
        body:
        {
          'token':GetStorage().read('mytoken'),
          'per_param': '10',
          'page_param': '1'});
        // });
    // Response response;
    // var dio= Dio();
    // response = await dio.post('http://sanatabzar128.ir/v2/addresses',
    //     data: {
    //   'token':GetStorage().read('mytoken'),
    //       'per_param': '10',
    //       'page_param': '1'});



    try{
      if (response.statusCode == 201) {


        var jsonResponse =AddressModel.fromJson(convert.jsonDecode(response.body));
        return jsonResponse;

        // return AddressModel.fromJson(response.data);

      }

      else  {


        return null;
      }
    }catch(e){


      return null;

    }


  }


  static Future<bool?> deletAddress(String addressId) async{


    var url = Uri.http('sanatabzar128.ir', 'v2/delete-address');
    var response = await http.post(url,
        body:
        {
          'token':GetStorage().read('mytoken'),
          'per_param': '10',
          'page_param': '1',
        'address_id' : addressId,

        });


    // Response response;
    // var dio= Dio();
    // response = await dio.post('http://sanatabzar128.ir/v2/delete-address',
    //     data: {
    //   'token':'eyJpdiI6InBvN0ZoblZ2R1JFRmVYQi9xYnJheFE9PSIsInZhbHVlIjoieVhaRTFaZ1lMY0x4b1o1R3hnMnV0Zz09IiwibWFjIjoiMDUxYjM1ODk4NGFhMmJjMjUwNmNiMWQ2NWJlMjVhYzA4N2IyZTljMmY0ZDg2Njk3MGYzYTBkMTMzN2M4N2U5ZCIsInRhZyI6IiJ9',
    //       'per_param': '10',
    //       'page_param': '1',
    //       'address_id' : addressId,
    //     });

    try{
      if (response.statusCode == 200) {
        return true;
      }

      else  {
        print('heeeeeeeeeeeeeeeeeeeelppppp');
        return null;
      }
    }catch(e){
      print('hooooooooooooooooooooooooooooo');
      print(e);
      return null;

    }
  }
}