



import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:html/parser.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants.dart';
import '../../main_nav_page/presentation/main_nav_page.dart';
import '../contrroller/product_controller.dart';
import '../model/single_brand/products.dart';

class ProductsPage extends StatefulWidget {

  List <Products> productData;
  int? Index;
  ProductsPage({Key? key, required this.productData, required this.Index}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {

  var currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    currentIndex = widget.Index!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text("ابزار صنعت"),
        centerTitle: true,
        backgroundColor: primaryColor,
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
      body: Column(

        children: [



          Expanded(
            child: ListView(
              children: [
                Container(

                  width: 70.w,
                  height: 25.h,
                  margin: EdgeInsets.symmetric(horizontal:15, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),

                    image: DecorationImage(
                      image: NetworkImage(widget.productData[currentIndex].img ),
                      fit: BoxFit.fill,
                    ),
                  ),

                ),
                SizedBox(height: 16,),
                SizedBox(
                  width: 80.w,
                  child: Text(widget.productData[currentIndex].title, style:TextStyle(fontSize: 16,fontWeight: FontWeight.w600,),textDirection: TextDirection.rtl,textAlign: TextAlign.center,),

                ),
                SizedBox(height: 16,),
                Container(
                  width: 100.w,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child:Center(child: Text('قیمت:  ${widget.productData[currentIndex].price.toString()} تومان',style: const TextStyle(fontSize: 14,fontWeight:FontWeight.w700 ),textDirection: TextDirection.rtl,)),
                ),


                SizedBox(height: 16,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal:8.w),
                  width: 80.w,
                  child: Text(parse(widget.productData[currentIndex].content).body!.text,
                    style: const TextStyle(fontSize: 14, ),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,),

                )
              ],
            ),
          ),



         Container(
           width: 100.w,
           height: 8.h,
           decoration: BoxDecoration(
             color: grayWhiteColor,
             boxShadow: [
               BoxShadow(
                 color:Colors.grey.withOpacity(0.2),

                 offset: const Offset(
                   0.0,
                   -3.0,
                 ),
                 spreadRadius: 2,
                 blurRadius: 4,
               ), //BoxShadow
               //BoxShadow
             ],

           ),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               IconButton(
                   onPressed: (){
                     int leng = widget.productData.length;
                     if(currentIndex == 0){
                       setState(() {
                         currentIndex = leng - 1;
                       });
                     }else{
                       setState(() {
                         currentIndex = currentIndex - 1;
                       });
                     }
                   },
                    icon:Icon(Icons.arrow_back_ios_rounded)),
               IconButton(onPressed: (){
                 int leng = widget.productData.length;
                 if(currentIndex == leng-1){
                   setState(() {
                     currentIndex = 0;
                   });
                 }else{
                  setState(() {
                    currentIndex = currentIndex + 1;
                  });
                 }
               },
                   icon: Icon(Icons.arrow_forward_ios_rounded))
             ],
           ),
         )


        ],
      )
    );
  }
}
