





import 'package:get/get.dart';

import '../model/single_places/single_places.dart';
import '../model/single_places/slider_single_places.dart';
import '../remote/single_place_remote.dart';
import '../remote/submit_favorite.dart';


class SinglePlaceControll extends GetxController{
  var isLoading = true.obs;
  var singlePlaceControll = <SinglePlace>[];
  var singleSliderControll = < SliderSinglePlace>[];
  String titleControll = '';
  String descriptControll = '';
  String phoneControll = '';
  String addressControll = '';
  int placeId = 0;

  void fetchSinglePlace(String IdPlaces) async{

    isLoading(true);
    var Placeid = IdPlaces ;


    try{
      var products = await SinglePlaceRemote.fetchSinglePlace(Placeid);
      if(products != null){

        titleControll = products.single_place?.title as String;
        descriptControll = products.single_place?.description as String;
        phoneControll = products.single_place?.phone as String;
        addressControll = products.single_place?.address as String;
        placeId = products.single_place?.id ?? 0;

        update();

        for (var element in products.slider) {
          singleSliderControll.add(element);
          update();
        }
      }

    }finally{
      isLoading(false);
    }
  }


  void SubmitFavorite(String IdValue){
    var response = submitFavoriteRemote.fetchfavorite(IdValue);
  }

}