




import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


import '../../../../main_nav_page/presentation/main_nav_page.dart';
import '../model/Cities.dart';
import '../model/Divisions.dart';
import '../model/ListTypePlaces.dart';
import '../model/PlaceCategories.dart';
import '../model/Sub_place_category.dart';
import '../presentation/adding_steps/add_pics.dart';
import '../remote/new_shop_request.dart';
import '../remote/send_image_remote.dart';
import '../remote/submit_remote.dart';

class NewShopController extends GetxController{

  var Ostans = <Divisions>[];
  var OstanNames = <String>[];
  var cities = <Cities>[];
  var cityNames = <String>[];
  var places = <PlaceCategories>[];
  var listPlaces= <ListTypePlaces>[];
  var selectedDivision = ''.obs;
  var selectedIdDivision = '8'.obs;
  var selectedCity = ''.obs;
  var selectedCityId = 0.obs;
  var Sliders = <String>[].obs;
  var UploadingImg = false.obs;
  var selectedListPlace = ''.obs;
  var selectedListPlacetitle = ''.obs;
  var selectedListPlaceId = 0.obs;
  var selectedCategory = ''.obs;
  var selectedCategoryId = ''.obs ;
  int id_palce = 0;
  var categorizedPlaceCategory = <PlaceCategories>[].obs;
  var subplaceCategory = <SubPlaceCategory>[].obs;
  var selctedSubCategory = ''.obs;
  var selectedsubCatePId = ''.obs;

  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptController = TextEditingController();




  @override
  void onInit() {
    // TODO: implement onInit

    GetNewPlace('8');
    selectedDivision.value = 'تهران';

    super.onInit();

  }




  void GetNewPlace(String idvision) async{
    OstanNames.clear();
    Ostans.clear();
    cities.clear();
    listPlaces.clear();
    places.clear();
    cityNames.clear();
    cities.clear();
    var response = await NewShopRequest.getNewShop(idvision,'shop','1');

    if (response != null){

      response.divisions?.forEach((element) {
        Ostans.add(element);
        update();
      });

      response.cities?.forEach((element) {
        cities.add(element);
        update();
      });

      response.placeCategories?.forEach((element) {
        places.add(element);
        update();
      });

      response.listTypePlaces?.forEach((element) {
        listPlaces.add(element);
        update();
      });

      response.subPlaceCategory?.forEach((element) {
        subplaceCategory.add(element);

      });

      Ostans.forEach((element) {
        OstanNames.add(element.name??'');
      });

      cities.forEach((element) {
        cityNames.add(element.name??'');
      });

      places.forEach((element) {
        categorizedPlaceCategory.add(element);
      });

      selectedCity.value = cityNames[0];
      selectedCityId.value = cities[0].id!;
      selectedListPlace.value = listPlaces[0].name!;
      selectedListPlacetitle.value = listPlaces[0].title!;
      selectedCategory.value = categorizedPlaceCategory[0].title!;
      selectedCategoryId.value = categorizedPlaceCategory[0].id.toString();
      selctedSubCategory.value = subplaceCategory[0].title!;
      selectedsubCatePId.value = subplaceCategory[0].parentId.toString();
    }

  }



  void GetCity(String idvision) async{
    cityNames.clear();
    cities.clear();
    var response = await NewShopRequest.getNewShop(idvision,'','');
    if (response != null){



      response.cities?.forEach((element) {
        cities.add(element);
        update();
      });



      cities.forEach((element) {
        cityNames.add(element.name??'');
      });

      selectedCity.value = cityNames[0];
      selectedCityId.value = cities[0].id!;

    }

  }

  void GetSubplace(String title,String id) async{


    var response = await NewShopRequest.getNewShop('',title,id);
    if (response != null) {
      subplaceCategory.clear();

      response.subPlaceCategory?.forEach((element) {
        subplaceCategory.add(element);
        update();
      });
      selctedSubCategory.value = subplaceCategory[0].title??"";
      selectedsubCatePId.value = subplaceCategory[0].parentId.toString();
      update();
    }
  }

  void ChangeDivision(String divisionName){

    for(var element in Ostans){
      if (element.name == divisionName){

        selectedIdDivision.value = element.id.toString();
        selectedDivision.value = element.name??"";
        GetCity(element.id.toString());
        update();

      }
    }

  }

  void ChangeCity(String cityName){

    for(var element in cities){
      if (element.name == cityName){

        selectedCityId.value = element.id!;
        selectedCity.value = element.name??"";

        update();

      }
    }

  }


  void SendImage(File file) async{
    UploadingImg(true);
    var response = await SendImageRemote.upload(file);

    if (response != null){

      Sliders.add(response.pathfile);

      UploadingImg(false);
      update();
    }


  }

  void ChangeList(String element){
    listPlaces.forEach((y) {
      if(y.name == element){
        selectedListPlace.value = y.name!;

        selectedListPlacetitle.value=y.title!;

        selectedListPlaceId.value = y.id!;

        update();
      }
    });
    categorizedPlaceCategory.clear();
    places.forEach((v) {
      if (v.type == selectedListPlacetitle.value){
        categorizedPlaceCategory.add(v);
        update();
      }
    });
    selectedCategory.value = categorizedPlaceCategory[0].title!;
    selectedCategoryId.value = categorizedPlaceCategory[0].id.toString();
    update();
  }


  void ChangeCategory(String element){
    categorizedPlaceCategory.forEach((y) {
      if(y.title == element){
        selectedCategory.value = y.title!;

        selectedCategoryId.value=y.id.toString();
        update();
      }
    });
    GetSubplace(selectedListPlacetitle.value,selectedCategoryId.value);

  }


  void ChangeSubCategory(String element){
    subplaceCategory.forEach((y) {
      if(y.title == element){
        selctedSubCategory.value = y.title!;

        selectedsubCatePId.value=y.parentId.toString();
        update();
      }
    });
  }


  void SubmitPlace() async{


    var ListSlid = Sliders.join(',');


    var response = await SubmitRemote.Submit(
        ListSlid,
        id_palce.toString(),
        nameController.text,
        selectedListPlaceId.value.toString(),
        selectedCategoryId.value,
        descriptController.text,
        phoneController.text,
        addressController.text,
        selectedCityId.value.toString(),

    );

    if (response != null){

      Get.off(()=>MainNavPage());
    }




  }


  void EditPlace(List<String> SlidesPath,

    int IdPlace,
      String title, String Address,String phone, String description){
    Sliders.clear();
    SlidesPath.forEach((element) {
      Sliders.add(element);
      update();
    });
    id_palce = IdPlace;
    nameController.text = title;
    addressController.text = Address;
    phoneController.text = phone;
    descriptController.text = description;
    update();
    Get.to(()=>AddingPics());


  }

}