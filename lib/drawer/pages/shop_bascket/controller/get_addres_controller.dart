



import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/address_model/Data.dart';
import '../remote/complete_shoping.dart';
import '../remote/get_address_remote.dart';

class AddressController extends GetxController{

  var addressList = <addressData>[];
  var SelectedAddressid = 0;
  var isError = false.obs;
  var ErrorMsg = ''.obs;
  var url = 'noting'.obs;

   GetAddress() async{

    var response= await AdressRemote.fetchAddress();

    if (response != null){
      addressList.clear();
      response.data?.forEach((element) {
        addressList.add(element);
        update();
      });
    }
  }

  void selectAddress(int index){
    SelectedAddressid = addressList[index].id??0;
    print(SelectedAddressid);
    update();
  }

  void deleteAddress(int index) async{
    var addressId = addressList[index].id.toString();
    var response= await AdressRemote.deletAddress(addressId);

    if (response == true){
      addressList.clear();
      update();
      GetAddress();
    }
  }

  void CompleteShop() async{

    isError(false);
    var response = await CompleteShopingRemote.fetchShopUrl(SelectedAddressid.toString());

    if ( response?.success == 1){
      url.value = response?.url??"";
      final uri = Uri.parse(response?.url??"");

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw response?.msg.toString()??"";
      }
    }else{
      isError(true);
      ErrorMsg.value = response?.msg??"";
      update();
    }

  }

}