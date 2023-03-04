





import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:html/parser.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';


import '../../core/constants.dart';

import '../controller/single_place_controller.dart';
import '../widgets/violation.dart';

class SinglePlacesPage extends StatefulWidget {
  String id_value;
   SinglePlacesPage({Key? key,required this.id_value}) : super(key: key);

  @override
  State<SinglePlacesPage> createState() => _SinglePlacesPageState();
}



class _SinglePlacesPageState extends State<SinglePlacesPage> {
  SinglePlaceControll _controller = Get.put(SinglePlaceControll());



  @override
  void initState() {
    // TODO: implement initState
    _controller.fetchSinglePlace(widget.id_value);
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.phoneControll;
    _controller.addressControll;
    _controller.descriptControll;
    _controller.singleSliderControll;
    _controller.singlePlaceControll;
    _controller.titleControll;
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: GetBuilder<SinglePlaceControll>(builder: (_)=>Text(_controller.titleControll),),
        centerTitle: true,
      ),
      body: Obx((){
        return _controller.isLoading.isTrue ?
        const Center(child: CircularProgressIndicator(),) :

        Column(

          children: [
            GetBuilder<SinglePlaceControll>(builder: (_){
              return Container(
                margin: EdgeInsets.only(top:3.h),
                width: 90.w,
                height: 30.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),

                ),
                child: CarouselSlider.builder(

                  options: CarouselOptions(
                    autoPlay: false,
                    viewportFraction: 1,
                    aspectRatio: 2.0,
                    initialPage: 2,
                    enableInfiniteScroll: true,
                  ),
                  itemCount: _controller.singleSliderControll.length,
                  itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Container(

                        width: 85.w,
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(25),
                          image:  DecorationImage(

                            image: NetworkImage( _controller.singleSliderControll[itemIndex].img ?? ""),
                            fit: BoxFit.fitWidth,
                          ),
                        ),

                      ),
                ),
              );
            }),
            const SizedBox(height: 15,),

            Expanded(child: ListView(
              children: [
                GetBuilder<SinglePlaceControll>(builder: (_)=>Text(_controller.titleControll,
                  style:const TextStyle(fontSize: 20),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,),),
                const SizedBox(height: 16,),
                Text(parse(_controller.descriptControll).body!.text,
                  style: const TextStyle(fontSize: 13,fontWeight:FontWeight.w700),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,),
                SizedBox(
                  width: 90.w,
                  height:120,
                  child: Column(

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          IconButton(onPressed: () async{
                            await Clipboard.setData(ClipboardData(text: _controller.addressControll.toString()));
                          },
                              icon: const Icon(Icons.copy_outlined)),
                          const Text("آدرس",style: TextStyle(fontSize: 14, fontWeight:FontWeight.w700),),
                        ],
                      ),

                      const Divider(height: 2,color: Colors.black54,),
                      const SizedBox(height: 16,),
                      Text(_controller.addressControll,
                        style: const TextStyle(fontSize: 13),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,),
                      const Expanded(child: SizedBox()),

                    ],
                  ),
                ),
                SizedBox(
                  width: 90.w,

                  child: Column(
                    children: [

                      const Text("شماره تماس",style: TextStyle(fontSize: 14, fontWeight:FontWeight.w700),),
                      const Divider(height: 2,color: Colors.black54,),
                      const SizedBox(height: 16,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: (){_makingPhoneCall('tel://${_controller.phoneControll.replaceFirst('0', '+98')}');}, icon: const Icon(Icons.phone_android)),
                          Text(_controller.phoneControll,
                            style: const TextStyle(fontSize: 13),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,),


                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25,),
              ],
            )
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(onPressed:(){
                    Get.to(()=>Violation(id_product:_controller.placeId,));
                  } ,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all( primaryColor),


                      elevation: MaterialStateProperty.all(0),
                      padding:MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal:16, vertical: 8)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    ),
                    icon: const Icon(Icons.not_interested_outlined),
                    label: const Text("ثبت تخلف!",style: TextStyle(fontSize: 12), textDirection:TextDirection.rtl,),
                  ),
                  ElevatedButton.icon(
                      onPressed:(){
                        _controller.SubmitFavorite(_controller.placeId.toString());
                      },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all( secondaryColor),


                      elevation: MaterialStateProperty.all(0),
                      padding:MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal:8, vertical: 8)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                    ),
                      icon: const Icon(Icons.favorite_border),
                      label: const Text("افزودن به علاقه\u200cمندی\u200c",style: TextStyle(fontSize: 12),),),

                ],
              ),
            const SizedBox(height: 16,)
          ],
        );
      })

    );
  }
}




_makingPhoneCall(String tel) async {
  var url = Uri.parse(tel);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'امکان برقراری تماس وجود ندارد!';
  }
}
