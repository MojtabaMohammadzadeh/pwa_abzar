




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/constants.dart';
import '../../main_nav_page/presentation/main_nav_page.dart';
import '../controller/sub_shop_controller.dart';
import '../widgets/shop_horizental_list.dart';
import '../widgets/shop_search.dart';

class SubShopPage extends StatefulWidget {
  String title;
  String categoryId;
  SubShopPage({Key? key,required this.categoryId, required this.title}) : super(key: key);

  @override
  State<SubShopPage> createState() => _SubShopPageState();
}

class _SubShopPageState extends State<SubShopPage> {
  SubShopController _subShopController = Get.put(SubShopController());
  @override
  void initState() {
    // TODO: implement initState
    _subShopController.vipSubCategoryList.clear();
    _subShopController.fetchSubCategory(widget.categoryId);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    ShopHorizentalList(ListData: [],);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: primaryColor,
        title: Text(widget.title, style:const TextStyle(fontSize:14),),
        centerTitle: true,
        actions: <Widget>[
          IconButton(onPressed: () {Get.to(()=> ShopSearchField());  }, icon: const Icon(Icons.search_rounded),),
          IconButton(
            icon: const Icon(
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
        children:  [
          const SizedBox(height: 25,),

          Expanded(
              child:GetBuilder<SubShopController>
                (builder:(_)=> ShopHorizentalList(ListData: _subShopController.vipSubCategoryList,),) ),


        ],
      ),
    );
  }
}
