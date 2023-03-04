




import 'package:get/get.dart';

import '../model/sub_category/list_sliders.dart';
import '../model/sub_category/sub_places_category.dart';
import '../remote/sub_category_remote.dart';

class SubCategoryController extends GetxController{
  var isLoading = true.obs;
  var controllSubCategoryList = <subPlacescategory>[];
  var controllPageTitle = '';
  var slider = <ListSliders>[];


  void fetchSubCategory(String idCategory) async {
    isLoading(true);
    var IdCategory = idCategory ;
    try{

      var products = await SubCategoryRemote.fetchSubCategory(IdCategory);

      if (products != null){

        controllPageTitle = products.parentName;

        products.placescategory.forEach((element) {
          controllSubCategoryList.add(element);

          update();
        });
        update();
      }
    }finally{
      isLoading(false);
    }

  }

}