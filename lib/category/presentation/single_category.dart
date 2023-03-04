




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants.dart';
import '../controller/sub_category_controller.dart';
import '../widgets/category_horizental_list.dart';
import '../widgets/category_search_field.dart';

class SingleCategory extends StatefulWidget {
  String categoryId;
   SingleCategory({Key? key,required this.categoryId}) : super(key: key);

  @override
  State<SingleCategory> createState() => _SingleCategoryState();
}

class _SingleCategoryState extends State<SingleCategory> {
  SubCategoryController _controller = Get.put(SubCategoryController());
@override
  void initState() {
    // TODO: implement initState
  _controller.fetchSubCategory(widget.categoryId);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    CategoryHorizentalList(ListData:  [],);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: GetBuilder<SubCategoryController>(builder:(_)=> Text(_controller.controllPageTitle,style:const TextStyle(fontSize:12),),),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(CategorySearchField());
              // do something
            },
          )
        ],
      ),

      body: Column(
        children:  [
          const SizedBox(height: 25,),

          Expanded(
              child:GetBuilder<SubCategoryController>
                (builder:(_)=> CategoryHorizentalList(ListData: _controller.controllSubCategoryList,),) ),


        ],
      ),
    );
  }
}
