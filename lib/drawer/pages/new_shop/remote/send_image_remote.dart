




import 'dart:io';

import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../model/slider_model/slider_model.dart';

class SendImageRemote{





  static Future<SliderModel?> upload(File file) async {

    var stream = new http.ByteStream(file.openRead());
    stream.cast();
    // get file length
    var length = await file.length();
    var url = Uri.http('sanatabzar128.ir', 'v2/uploadsliderplace');
    http.MultipartRequest request = new http.MultipartRequest("POST", url);
    request.fields["token"] = GetStorage().read('mytoken');
    var multipartFile = new http.MultipartFile('image_file', stream, length, filename: basename(file.path));
    request.files.add(multipartFile);
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    // return response;

  }
    // Response response;
    // String? fileName = file.path.split('/').last;
    //
    //
    // FormData data = FormData.fromMap({
    //   "img": await MultipartFile.fromFile(
    //     file.path,
    //     filename: fileName,
    //   ),
    //
    //   "token" :GetStorage().read('mytoken'),
    //
    // });
    //
    // Dio dio = Dio();
    //
    // response= await dio.post('http://sanatabzar128.ir/v2/uploadsliderplace', data: data);

    // try{
    //   if (response.statusCode == 200) {
    //
    //     return SliderModel.fromJson(response.data);
    //   }
    //
    //   else {
    //
    //
    //     return null;
    //   }
    // }catch(e){
    //
    //   return null;
    //
    // }

  }


