



import 'package:get/get.dart';

import '../model/place_category.dart';
import '../remote/category_remote.dart';

class AllCategoryController extends GetxController{
  var isLoading = true.obs;
  var controllPlacesCategory = <Placescategory>[].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAllCategory();
  }

  fetchAllCategory() async {
    isLoading(true);

    try{

     var products = await CategoryRemote.fetchCategory();

     if (products != null){
        products.placescategory?.forEach((element) {
          controllPlacesCategory.add(element);
          update();
        });
     }
    }finally{
      isLoading(false);
    }

  }
}