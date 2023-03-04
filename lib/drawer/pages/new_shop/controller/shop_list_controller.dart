




import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/new_shop_list/Places.dart';
import '../remote/shop_lists.dart';

class ShopListController extends GetxController{

  var ShopLists = <Places>[];


  @override
  void onInit() {
    // TODO: implement onInit
    GetShopLists();
    super.onInit();
  }


  void GetShopLists() async{

    var response = await ShopListsRemote.getShopList();

    if (response != null){

      response.places?.forEach((element) {

        ShopLists.add(element);
        update();
      });

    }

  }


}