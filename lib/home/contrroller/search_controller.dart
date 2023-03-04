


import 'package:get/get.dart';

import '../model/search_model/Search_model.dart';
import '../remote/search_remote.dart';

class SearchController extends GetxController{

  var IndexforSearch = 0.obs;
  var SerachList = <ListSearch>[].obs;

  void searchIndex(int index){

    IndexforSearch.value = index;
    SerachList.clear();
    update();
  }

  void ClearList(){

    SerachList.clear();
    update();
  }


  void SearchFetch(String Index, String SearchValue) async{

    var response = await SearchRemote.fetchSearch(Index,SearchValue);

    if (response != null){
      SerachList.clear();
      response.list?.forEach((element) {
        SerachList.add(element);
        update();
      });

    }


  }


}