



import 'package:get/get_state_manager/get_state_manager.dart';

import '../../category/remote/violet_remote.dart';

class VioletController extends GetxController{




  void SendReport(String Id) async{

    var response = await VioletRemote.fetchviolet(Id);


    if (response == true){


    }

  }

}