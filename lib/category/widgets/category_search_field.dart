





import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants.dart';
import '../../main_nav_page/presentation/main_nav_page.dart';
import '../controller/sub_category_controller.dart';

import '../model/sub_category/list_sliders.dart';
import '../model/sub_category/sub_places_category.dart';
import '../presentation/single_places_page.dart';

class CategorySearchField extends StatefulWidget {
  CategorySearchField ({Key? key}) : super(key: key);

  @override
  State<CategorySearchField > createState() => _CategorySearchFieldState();
}

class _CategorySearchFieldState extends State<CategorySearchField > {
  final TextEditingController _controller = TextEditingController();
  SubCategoryController _subCategoryController = Get.put(SubCategoryController());


  List<subPlacescategory> searchTherms = [];

  List<ListSliders> items = [];

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
                        onPressed: (){_controller.text = '';},
                      ),

                      Expanded(
                        child: TextFormField(
                          controller: _controller,
                          onChanged: (String value){
                            searchTherms = _subCategoryController.controllSubCategoryList;
                            items.clear();
                            if(value.isEmpty){
                              items.clear();
                            }else{
                              for (var element in searchTherms) {
                                element.list_sliders?.forEach((v) {
                                  if (v.name?.toLowerCase().contains(value.toLowerCase())?? false ) {
                                    items.add(v);
                                  }
                                });
                              }
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
                          Get.to(()=>SinglePlacesPage(id_value: items[index].id_value.toString(),));
                        },
                        child: Container(
                            width: 100.w,
                            height: 15.h,
                            padding: const EdgeInsets.symmetric(horizontal:8, vertical: 8),

                            decoration: BoxDecoration(
                              color: grayWhiteColor,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow:  [
                                BoxShadow(
                                  color: metalColor.withOpacity(0.4),
                                  offset: const Offset(2.0, 3.0),
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                ),
                              ],

                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),

                            child:Row(
                              children: [
                                Container(
                                  width: 30.w,
                                  height: 15.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        image: NetworkImage(items[index].img??""),
                                        fit: BoxFit.fill,
                                      )
                                  ),
                                ),
                                const SizedBox(width: 8,),
                                SizedBox(
                                  width: 40.w,
                                  child: Text(items[index].name??"",
                                    textDirection: TextDirection.rtl,textAlign: TextAlign.start,
                                    style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w700),
                                    maxLines: 3,
                                    overflow: TextOverflow.fade,
                                  ),
                                )
                              ],
                            )
                        ),
                      );
                    }))




              ],
            )
        ),
      ),
    );
  }
}
