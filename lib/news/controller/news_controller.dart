




import 'package:get/get.dart';


import '../model/News_model.dart';
import '../remote/news_remote.dart';

class NewsController extends GetxController{
  var isLoading = true.obs;
  var News = <NewsModel>[];
  var responses;


  @override
  void onInit() {
    // TODO: implement onInit
    fetchNews();
    super.onInit();
  }


   fetchNews() async{

    isLoading(true);

    try{

      responses = await NewsRemote.fetchNews();

      if (responses != null){

        responses.forEach((element) {
          News.add(element);

          update();
        });

      }else {

      }


    }finally{

      isLoading(false);
    }


  }


}