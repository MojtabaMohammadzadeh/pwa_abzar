


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


import '../../core/constants.dart';

import '../../main_nav_page/presentation/main_nav_page.dart';
import '../contrroller/search_controller.dart';

import '../model/search_model/Search_model.dart';
import '../subpages/single_brand.dart';





class HomeSearchField extends StatefulWidget {
  HomeSearchField ({Key? key}) : super(key: key);

  @override
  State<HomeSearchField > createState() => _HomeSearchFieldState();
}

class _HomeSearchFieldState extends State<HomeSearchField > {
  final TextEditingController _controller = TextEditingController();
  SearchController _searchcontroller = Get.put(SearchController());



  late List<ListSearch> searchTherms ;

  late List<ListSearch> items=[];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grayWhiteColor,
      body: SafeArea(
        child: Directionality(
            textDirection: TextDirection.rtl,

            child: GetBuilder<SearchController>(builder:(_){
              return Column(
                children: [
                  Container(
                    height: 48,
                    width: 100.w,
                    margin:const EdgeInsets.symmetric(vertical: 16,horizontal: 4),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: primaryColor),
                      borderRadius: BorderRadius.circular(12),

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: (){_controller.text = '';
                          _searchcontroller.ClearList();
                            },
                        ),

                        Expanded(
                          child: TextFormField(
                            controller: _controller,
                            onChanged: (String value){

                              _searchcontroller.ClearList();


                              (_controller.text.length > 2)? _searchcontroller.SearchFetch(_searchcontroller.IndexforSearch.toString(), value): (){};

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
                  Container(
                    color: primaryColor,
                    width: 100.w,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Obx(() {
                          return GestureDetector(
                              onTap: (){
                                _searchcontroller.searchIndex(0);
                              },
                              child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                                  decoration: BoxDecoration(
                                    border:(_searchcontroller.IndexforSearch.value == 0)? const Border(bottom:BorderSide(color:grayWhiteColor, width: 1)):Border(),
                                  ),
                                  child: Text("برند",style: TextStyle(
                                      color:(_searchcontroller.IndexforSearch.value == 0)? whiteColor : metalColor,
                                      fontSize: 13,fontWeight:FontWeight.w500),)));
                        }),
                        Obx(() {
                          return GestureDetector(
                              onTap: (){
                                _searchcontroller.searchIndex(1);
                              },
                              child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                                  decoration: BoxDecoration(
                                    border:(_searchcontroller.IndexforSearch.value == 1)? const Border(bottom:BorderSide(color:grayWhiteColor, width: 1)):Border(),
                                  ),
                                  child: Text("محصولات برندها",style: TextStyle(
                                      color:(_searchcontroller.IndexforSearch.value == 1)? whiteColor : metalColor,
                                      fontSize: 13,fontWeight:FontWeight.w500),)));
                        }),
                        Obx(() {
                          return GestureDetector(
                              onTap: (){
                                _searchcontroller.searchIndex(2);
                              },
                              child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                                  decoration: BoxDecoration(
                                    border:(_searchcontroller.IndexforSearch.value == 2)? const Border(bottom:BorderSide(color:grayWhiteColor, width: 1)):Border(),
                                  ),
                                  child: Text("محصولات فروشگاه",style: TextStyle(
                                      color:(_searchcontroller.IndexforSearch.value == 2)? whiteColor : metalColor,
                                      fontSize: 13,fontWeight:FontWeight.w500),)));
                        }),
                      ],
                    ),
                  ),

                  Expanded(child: Obx((){
                    return ListView.builder(
                        itemCount: _searchcontroller.SerachList.length,
                        itemBuilder: (context, index){
                          return GestureDetector(
                            onTap: (){
                              Get.to(
                                  SingleBrandPage(
                                    idBrand: _searchcontroller.SerachList[index].id.toString(),
                                  ));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 15, right: 10,left: 10),
                              width: 85.w,
                              height: 15.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color(0xfff5f5f5),
                                // border: Border.all(width: 1, color: Colors.black45),
                                boxShadow:  [
                                  BoxShadow(
                                    color: ravenColor.withOpacity(0.2),
                                    offset: const Offset(2.0, 4.0),
                                    blurRadius: 3,
                                    spreadRadius: 1,
                                  ),
                                ],




                              ),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(3.w),
                                      width:35.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage( _searchcontroller.SerachList[index].img?? ''),
                                            fit: BoxFit.fill
                                        ),
                                      ),

                                    ),
                                    const SizedBox(width: 16,),
                                SizedBox(
                                  width: 40.w,
                                  child: Center(
                                    child: Text( _searchcontroller.SerachList[index].title??''
                                      ,style: const TextStyle( fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          overflow:TextOverflow.ellipsis),
                                      maxLines: 3,),
                                  ),
                                )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }))




                ],
              );
            },)
        ),
      ),
    );
  }
}
