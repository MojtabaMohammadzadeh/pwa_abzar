



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../core/constants.dart';
import '../../main_nav_page/presentation/main_nav_page.dart';
import '../contrroller/single_brand_controller.dart';
import '../widgets/about_us.dart';

import '../widgets/contact_us.dart';
import '../widgets/single_brand_last_price.dart';
import '../widgets/single_list_viwe.dart';
import '../widgets/single_slider.dart';

class SingleBrandPage extends StatefulWidget {
 final String idBrand;

  SingleBrandPage({Key? key, required this.idBrand}) : super(key: key);

  @override
  State<SingleBrandPage> createState() => _SingleBrandState();
}

class _SingleBrandState extends State<SingleBrandPage> {
  SingleBrandController _controller = Get.put(SingleBrandController());


  @override
  void initState() {
    // TODO: implement initState
    _controller.getSingleBrand(widget.idBrand);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    SingleListViwe(ListData: [],);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: GetBuilder<SingleBrandController>(
          builder: (_){
            return Text(_controller.brandName , style: TextStyle(fontSize:18),);
          },
        ),
        centerTitle: true,
        backgroundColor:primaryColor,
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

      body: Obx((){
        return _controller.isLoading.isTrue?
        (Center ( child: CupertinoActivityIndicator(
          color: primaryColor,  radius: 20,
        ),)) :
        (_controller.controllCategoryList.isEmpty)?SizedBox(child: Center(child: Text("در حال حاضر اطلاعاتی برای این برند ثبت نشده است.",
          style:TextStyle(fontSize: 15),textDirection: TextDirection.rtl,textAlign: TextAlign.center,),),)
            :Column(
          children: [

            Expanded(child: ListView(
              shrinkWrap: true,
              children: [

                SingleImageSlider(slidersData: _controller.controllSlider),
                const SizedBox(height: 20,),
                GetBuilder<SingleBrandController>(builder:(_){
                  return Row(
                    children: [
                      Expanded(child: SizedBox()),
                      Text('تعداد بازدید ${_controller.CountShow}', style:TextStyle(fontSize: 12, fontFamily: "DanaFaNum"),),
                      SizedBox(width: 8,),
                      Icon(Icons.remove_red_eye_outlined),
                      SizedBox(width: 16,),
                    ],
                  );
                }),
                SizedBox(height: 16,),
                GetBuilder<SingleBrandController>(
                  builder: (_)=> LastPriceSingle(lastPriceData: _controller.controllLastPrice,),),
                const SizedBox(height: 15,),

                GetBuilder<SingleBrandController>(
                  builder: (_)=> SingleListViwe(ListData:_controller.controllCategoryList,),),

              ],
            )),

            Container(
              decoration: BoxDecoration(
                color: grayWhiteColor,
                boxShadow: [
                  BoxShadow(
                    color:Colors.grey.withOpacity(0.3),

                    offset: const Offset(
                      0.0,
                      -2.0,
                    ),
                    spreadRadius: 1,
                    blurRadius: 4,
                  ), //BoxShadow
                  //BoxShadow
                ],
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20, left: 20),
                    child: ElevatedButton.icon(
                      onPressed:() {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context, builder: (context)=> AboutUs());
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xff0F1B6D).withOpacity(0)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15))),
                        elevation: MaterialStateProperty.all(0),
                      ),
                      icon: const Icon(Icons.person,color: ravenColor,),
                      label: const Text(
                          "درباره ما",style: TextStyle(color:primaryColor,fontSize:14, fontWeight:FontWeight.w700),
                      ),

                    ),
                  ),
                  VerticalDivider(width:2,color:ravenColor,),
                  Container(
                    margin: EdgeInsets.only(right: 20,left: 20),
                    child: ElevatedButton.icon(
                      onPressed:() {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context, builder: (context)=> ContactUs());
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xff0F1B6D).withOpacity(0)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15))),
                        elevation: MaterialStateProperty.all(0),

                      ),
                      icon: const Icon(Icons.phone,color: ravenColor,),
                      label: const Text(
                          "تماس با ما", style: TextStyle(color: primaryColor,fontSize:14, fontWeight:FontWeight.w700),
                      ),
                    ),
                  )
                ],
              ),
            ),

          ],
        );
      })
    );
  }
}

