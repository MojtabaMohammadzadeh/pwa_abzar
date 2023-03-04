



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants.dart';
import '../../../../main_nav_page/presentation/main_nav_page.dart';
import '../../../../shop/controller/shopListController.dart';
import '../../../../shop/model/subpage_shop/vip_products.dart';
import '../controller/shop_cart_controller.dart';
import '../model/cart_items/Items.dart';
import '../model/cart_items/Product.dart';
import 'get_address.dart';

class ShopBascket extends StatefulWidget {
  ShopBascket({Key? key}) : super(key: key);

  @override
  State<ShopBascket> createState() => _ShopBascketState();
}

class _ShopBascketState extends State<ShopBascket> {
  ShopCartController _shopCartController = Get.put(ShopCartController());


  @override
  void initState() {
    // TODO: implement initState
    _shopCartController.getCartsItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('سبد خرید'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.home_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Get.offAll(MainNavPage());
              // do something
            },
          )
        ],

      ),
      body: Column(

        children: [

          Obx((){
            return Container(
              width: 100.w,
              height: 10.h,
              color: grayWhiteColor,
              child: Center(child: Text('مجموع پرداخت شما: ${_shopCartController.totalPrice.value} تومان می\u200cباشد',
                style: const TextStyle(fontSize: 13,fontWeight:FontWeight.w700, fontFamily:"DanaFaNum"),
              )),
            );
          }),

      Expanded(child: ListView(
      children: [
        const SizedBox(height: 16,),

      Align(
          alignment: Alignment.center,
          child: GetBuilder<ShopCartController>(

            builder: (_){

            return Wrap(

                children: List.generate(_shopCartController.ShopCarts.length, (index){
                  return ShopCarts(items: _shopCartController.ShopCarts[index],);
                },)
            );
          },)
      ),
      ],
    ),),

          Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: 48,
              child:SizedBox.expand(
                child: ElevatedButton(
                    onPressed: (){
                      Get.to(()=>GetAddress());
                    },
                    style: ButtonStyle(

                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),

                            )
                        ),
                        backgroundColor:  MaterialStateProperty.all(primaryColor),

                        textStyle:
                        MaterialStateProperty.all(const TextStyle(fontSize: 13, fontWeight:FontWeight.w700,fontFamily:"Dana"))),
                    child: const Text("ثبت نهایی خرید")),
              )
          ),

        ] ),
    );
  }
}


class ShopCarts extends StatelessWidget {
  final Items items;
  ShopCarts({Key? key, required this.items}) : super(key: key);
  ShopCartController _shopCartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: ()=>_shopCartController.getCartsItems() ,
      child: Container(
        width: 45.w,
        height: 40.h,
        margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: grayWhiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 40.w,
              height: 15.h,
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(items.product?.img??""),
                  fit: BoxFit.fill
                )
              ),
            ),
            const SizedBox(height: 8,),
            SizedBox(
              height: 10.h,
              child: Text(items.product?.title??"", style:const TextStyle(fontSize:14,fontWeight:FontWeight.w700),textAlign:TextAlign.center,),
            ),
            const SizedBox(height: 8,),
            Text(" قیمت: ${items.product?.price} تومان", style:const TextStyle(fontSize:12,fontFamily:"DanaFaNum"),textDirection: TextDirection.rtl,),

            Expanded(child:GetBuilder<ShopCartController>(builder: (_){
              return Obx((){
                return (_shopCartController.isLoading.isFalse)?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){
                      _shopCartController.deleteCarts(items.id.toString());

                    }, icon:const Icon(Icons.delete)),


                    IconButton(onPressed:(items.cartItemQuantity! > 1)? (){
                      _shopCartController.dropByCarts(items.product?.id.toString()??"");
                    }:(){}, icon:const Icon(Icons.remove)),


                    Expanded(child:Text(items.cartItemQuantity.toString(),)) ,


                    IconButton(onPressed: (){
                      _shopCartController.addToCarts(items.product?.id.toString()??"");
                    }, icon:const Icon(Icons.add)),

                  ],
                ):
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [

                    SizedBox(
                      height: 5,
                      child: LinearProgressIndicator(

                        backgroundColor:grayWhiteColor,color:primaryColor,),
                    )
                  ],
                );
              });
            },) )
          ],
        ),

      ),
    );
  }
}

