




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants.dart';
import '../../main_nav_page/presentation/main_nav_page.dart';

class NewsSearchField extends StatefulWidget {
  NewsSearchField ({Key? key}) : super(key: key);

  @override
  State<NewsSearchField > createState() => _NewsSearchFieldState();
}

class _NewsSearchFieldState extends State<NewsSearchField > {
  final TextEditingController _controller = TextEditingController();

  List<String> searchTherms = ["هتل بین المللی قصر", "هتل قصر طلایی مشهد"];

  List items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grayWhiteColor,
      body: SafeArea(
        child: Directionality(
            textDirection: TextDirection.rtl,

            child: Column(
              children: [
                Container(
                  height: 48,
                  width: 100.w,
                  margin:EdgeInsets.symmetric(vertical: 16,horizontal: 4),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: primaryColor),
                    borderRadius: BorderRadius.circular(12),

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: (){_controller.text = '';},
                      ),

                      Expanded(
                        child: TextFormField(
                          controller: _controller,
                          onChanged: (String value){
                            items.clear();
                            if(value.isEmpty){
                              items.clear();
                            }else{
                              searchTherms.forEach((element) {
                                if (element.toLowerCase().contains(value.toLowerCase()) ) {
                                  items.add(element);
                                }
                              });
                            }


                            setState(() {});
                          },
                          keyboardType: TextInputType.text,
                          autocorrect: false,

                          autofocus: true,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            fontSize:14,
                            fontFamily: "Dana",
                            fontWeight: FontWeight.w400,

                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "جستجو...",
                            hintStyle: TextStyle(color: metalColor),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: (){Get.to(()=>MainNavPage());},
                          icon: const Icon(Icons.arrow_forward)),
                    ],
                  ),
                ),
                // ***************************End Search Box**************************


                Expanded(child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: (){
                          // Get.to(()=>HotelServices());
                        },
                        child: Container(
                          width: 100.w,
                          height: 60,
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),

                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(12),

                          ),
                          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),

                          child:Text(items[index],
                            textDirection: TextDirection.rtl,textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),
                          ),),
                      );
                    }))




              ],
            )
        ),
      ),
    );
  }
}
