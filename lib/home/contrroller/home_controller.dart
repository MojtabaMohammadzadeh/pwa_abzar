



import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

import '../../splash_screen/splash_controller/splash_controller.dart';
import '../model/all_brand_categories.dart';
import '../model/all_brands.dart';
import '../model/last_price.dart';
import '../model/slider.dart';
import '../remote/home_remote.dart';

class TabBarControll extends GetxController{
  final token = getToken();
  var isLoading = true.obs;
  var currentIndex = 0.obs;

  var msg = '';

  var products;
  var controlltabs = <AllBrandCategories>[];
  var allBrand = <AllBrands>[];
  var categorizedAllBrand = <AllBrands>[].obs;

  var controllSlider1 = <Sliders1>[].obs;
  var categorizedSliders = <Sliders1>[].obs;

  var controllMostViwe = <AllBrands>[].obs;
  var categorizedMostViwe = <AllBrands>[].obs;

  var controllLastPrice = <LastPrices> [].obs;

  var controllNewBrand = <AllBrands> [].obs;
  var categorizeNewBrand = <AllBrands> [].obs;
  var aboutUs = '';
  var address_contact = '';
  var instagram = '';
  var telegram = '';
  var google_plus = '';
  var tweeter = '';
  var whatsapp = '';
  var law = '';
  var link_app = '';
  //   // ***********************Init*********************
  @override
  void onInit() {
    // TODO: implement onInit
    fetchProducts();

    super.onInit();
  }

  // **************************Change Index***********************
  void changeIndex(Index){
    currentIndex.value = Index;
    categorizedAllBrand.clear();
    categorizedMostViwe.clear();
    categorizedSliders.clear();
    // ***************All Brands*******************
    allBrand.forEach((element) {
      if(element.category_brand_id == Index+1){
        categorizedAllBrand.add(element);
        update();
      };
    });

    // ********************New Brands***************
    controllNewBrand.forEach((element) {
      if(element.category_brand_id == Index+1){
        categorizeNewBrand.add(element); };
    });

    // *****************Most Viwe********************
    controllMostViwe.forEach((element) {
      if(element.category_brand_id == Index+1){
        categorizedMostViwe.add(element); };
      update();
    });

    controllSlider1.forEach((element) {

      if(element.category_brand_id== Index+1){
        categorizedSliders.add(element);
        update();
      }

    });
  }


//************Fetch Data Call From remote********************


   fetchProducts() async{
    isLoading(true);
    final token = getToken();

    try{

      products=  await HomeRemote.fetchHome(token?? "");



      if(products != null){
        controllSlider1.clear();
        allBrand.clear();
        controlltabs.clear();
        controllMostViwe.clear();
        controllLastPrice.clear();
        controllNewBrand.clear();
        msg = products?.msg;
        update();
        // ***************Most Viwe*******************
        products.mostViewedBrands?.forEach((element) {
          controllMostViwe.add(element);
        });

        // ****************New Brands*********************
        products.newBrands?.forEach((element) {
          controllNewBrand.add(element);
        });

        // ***************Tabs **************************
        products.allBrandCategories?.forEach((element) {
          controlltabs.add(element);
        });

        // ******************All Brands*******************
        products.allBrands?.forEach((element) {
          allBrand.add(element);
        });

        // ******************* Sliders ***********************
        products.sliders1?.forEach((item) {
          controllSlider1.add(item);
        });


        // ********************Last Price*************************
        products.lastPrices?.forEach((element) {
          controllLastPrice.add(element);
        });

        aboutUs = products.about_us;
        address_contact = products.address_contact;
        instagram = products.instagram;
        telegram = products.telegram;
        google_plus = products.google_plus;
        tweeter = products.tweeter;
        whatsapp = products.whatsapp;
        link_app = products.link_app;
        law = products.law;
        update();
        changeIndex(0);
      }else{

      }
    }finally{
      isLoading(false);
    }
  }


}


String? getToken() {
  final box = GetStorage();
  return box.read(CacheManagerKey.TOKEN.toString());
}

enum CacheManagerKey { TOKEN }