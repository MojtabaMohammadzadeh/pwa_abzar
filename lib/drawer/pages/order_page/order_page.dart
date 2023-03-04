






import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


import '../../../core/constants.dart';
import '../../../main_nav_page/presentation/main_nav_page.dart';
import 'controller/order_controller.dart';
import 'order_modal.dart';

class OrderPage extends StatelessWidget {
  OrderPage({Key? key}) : super(key: key);

  OrderController _orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('لیست سفارشات'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(MainNavPage());
              // do something
            },
          )
        ],

      ),

      body: GetBuilder<OrderController>(
        builder: (_){
          return ListView.builder(
            itemCount: _orderController.ordersList.length,
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  Get.to(()=>OrderModal(
                    titleModal: _orderController.ordersList[index].title??"",
                    address: _orderController.ordersList[index].address??"",
                    Message: _orderController.ordersList[index].messageDelivery??"",
                    Date: _orderController.ordersList[index].createdAt??"",
                    refralCode: _orderController.ordersList[index].authority??"",));

                },
                child: Container(
                    height: 15.h,
                    margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xfff5f5f5),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        //background color of box
                        BoxShadow(
                          color: Colors.black54.withOpacity(0.3),
                          blurRadius: 5, // soften the shadow
                          spreadRadius: 2, //extend the shadow
                          offset: const Offset(
                            2, // Move to right 10  horizontally
                            5, // Move to bottom 10 Vertically
                          ),
                        ),

                      ],

                    ),
                    child: Column(

                      children: [
                        Container(

                          margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(_orderController.ordersList[index].title??"",style: TextStyle(fontWeight:FontWeight.w700,fontSize: 16),),
                          ),
                        ),
                        const SizedBox(height: 8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(_orderController.ordersList[index].createdAt??"",
                              style: const TextStyle(fontWeight:FontWeight.w500,fontSize: 14),),
                            Text(_orderController.ordersList[index].messageDelivery??"",
                              style: const TextStyle(fontWeight:FontWeight.w500,fontSize: 14),),

                          ],
                        )
                      ],
                    )

                ),
              );
            },

          );

        },
      ),
    );
  }
}
