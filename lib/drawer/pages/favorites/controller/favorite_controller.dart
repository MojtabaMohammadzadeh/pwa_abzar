



import 'package:get/get.dart';

import '../model/favorite_places.dart';
import '../remote/favorite_remote.dart';

class FavoriteController extends GetxController{
  var isLoading = true.obs;
  List<FavoritePlaces> favoriteList = [];


   fetchFavorite() async{

    isLoading(true);

   var response = await FavoriteRemote.fetchfavorite();

   if (response != null){
     favoriteList.clear();
     response.places?.forEach((element) {

       favoriteList.add(element);

        update();
     });
   }
    isLoading(false);
  }



  removeFavorite(String IdFavorite) async{

    var response =await FavoriteRemote.removefavorite(IdFavorite);

    if(response == true){
      isLoading(true);
      favoriteList.clear();

      update();
      fetchFavorite();

    }

  }
}