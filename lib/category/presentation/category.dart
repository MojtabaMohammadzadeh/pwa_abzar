

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants.dart';
import '../../drawer/drawer.dart';
import '../../home/widgets/search_box.dart';
import '../controller/category_controller.dart';
import '../widgets/category_cart.dart';





class Category extends StatelessWidget {

   Category({Key? key}) : super(key: key);
  AllCategoryController _controller = Get.put(AllCategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: const Text('دسته بندی',style: TextStyle(fontWeight:FontWeight.w500)),
        leading: IconButton(onPressed: () {
          Get.to(()=>HomeSearchField());
        }, icon: const Icon(Icons.search_rounded),),
        backgroundColor: primaryColor,
      ),
      endDrawer:  EndDrawer(),
        body: RefreshIndicator(
          onRefresh: ()=>_controller.fetchAllCategory(),
          child: Container(
      decoration: const BoxDecoration(

      ),
      child: ListView(
          children: [
            Align(
              alignment: Alignment.center,
              child: Wrap(

                  children: List.generate(_controller.controllPlacesCategory.length, (index){
                    return CategoryCart(categoryData:_controller.controllPlacesCategory, index: index,);
                  },)
              ),
            ),
          ],
      ),
    ),
        ),
    );
  }
}
