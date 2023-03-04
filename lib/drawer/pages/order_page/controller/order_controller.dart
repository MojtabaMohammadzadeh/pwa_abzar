



import 'package:get/get.dart';

import '../model/orders_data.dart';
import '../remote/order_remote.dart';

class OrderController extends GetxController{

  List<OrdersData> ordersList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    fetchOrders();
    super.onInit();
  }

  void fetchOrders() async{
    var response = await OrderRemote.fetchOrder();

    if (response != null){
      response.data?.forEach((element) {
        ordersList.add(element);
        update();
      });
    }
  }

}