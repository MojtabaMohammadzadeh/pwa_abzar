


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import 'package:url_launcher/url_launcher.dart';

import '../../core/constants.dart';
import '../../drawer/drawer.dart';
import '../contrroller/home_controller.dart';
import '../subpages/all_brands_list.dart';
import '../widgets/all_brands_grid.dart';
import '../widgets/horizental_list_widget.dart';
import '../widgets/image_slider.dart';
import '../widgets/last_price.dart';
import '../widgets/search_box.dart';
import '../widgets/tab_bar_widget.dart';
import '../widgets/title_widget.dart';


class Home extends StatefulWidget {

   Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TabBarControll _tabcontroller = Get.put(TabBarControll());

  @override
  void initState() {
    super.initState();
    if(_tabcontroller.msg == '01'){
      _showDialog();
    }
  }

  _showDialog() async {
    await Future.delayed(const Duration(milliseconds: 8000));
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("به روز رسانی نرم\u200cافزار",textDirection:TextDirection.rtl,textAlign: TextAlign.center,),
        content: const Text("کاربر گرامی. \nنسخه جدید از اپلیکیشن ابزار صنعت موجود می\u200cباشد. با بروزرسانی می\u200cتوانید از امکانات بیشتر این اپلیکیشن استفاده کنید.",textDirection:TextDirection.rtl,textAlign: TextAlign.center,),
        actions: <Widget>[
          TextButton(
            onPressed: () async{
              final Uri _url = Uri.parse('https://cafebazaar.ir/app/fenix.team.aln.abzar_sanat');
              if (!await launchUrl(_url)) {
                throw Exception('Could not launch $_url');
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(12),
                
              ),
              padding: const EdgeInsets.all(14),
              child: const Text("به روز رسانی",style:TextStyle(fontSize:14,fontWeight:FontWeight.w700,color:grayWhiteColor ),),
            ),
          ),
        ],
      ),
    );}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
        appBar: AppBar(

          centerTitle: true,
          title: const Text('ابزار صنعت',style: TextStyle( fontSize: 18)),
          backgroundColor: primaryColor,
          leading: IconButton(onPressed: () {
            Get.to(()=>HomeSearchField());
          }, icon: const Icon(Icons.search_rounded),),
        ),
        endDrawer:  EndDrawer(),




      body:RefreshIndicator(
        onRefresh: ()=>_tabcontroller.fetchProducts(),

        child: Obx((){
          return _tabcontroller.isLoading.isTrue ?
          const Center(child: CupertinoActivityIndicator(
            color: primaryColor,  radius: 20,
          ),) :
          Align(
            alignment: Alignment.center,
            child: ListView(
              children: [

                // HomeSearchBox(),
                GetBuilder<TabBarControll>(builder: (_)=>ImageSlider(slidersData: _tabcontroller.categorizedSliders),),

                TabBarWidget(tabsData:_tabcontroller.controlltabs,),
                const SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [


                    ElevatedButton.icon(onPressed: (){Get.to(AllBrandsList());},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.orangeAccent.withOpacity(0)),
                          elevation: MaterialStateProperty.all(0.0),
                        ),



                      icon: const Icon(Icons.arrow_back_ios,color:redSecondaryColor,),
                    label:const Text("مشاهده همه",style: TextStyle(color:redSecondaryColor),), ),
                    const Text("پربازدیدترین برندها",style: TextStyle(fontSize:13, fontWeight: FontWeight.w700),),

                  ],
                ),

                const Divider(color: Colors.black,height:2,),
                const SizedBox(height: 8,),
                GetBuilder<TabBarControll>(builder: (_)=> HorizentalList(listData: _tabcontroller.categorizedMostViwe),),
                TitleWidget(title: 'آخرین قیمت ها', link: '', linkText: '',),
                LastPriceWidget(lastPriceData: _tabcontroller.controllLastPrice,),
                const Divider(color: Colors.black,height:2,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(onPressed: (){Get.to(AllBrandsList());},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.orangeAccent.withOpacity(0)),
                        elevation: MaterialStateProperty.all(0.0),
                      ),



                      icon: const Icon(Icons.arrow_back_ios,color:redSecondaryColor,),
                      label:const Text("مشاهده همه",style: TextStyle(color:redSecondaryColor),), ),
                    const Text("جدیدترین برندها",style: TextStyle(fontSize:13, fontWeight: FontWeight.w700),),

                  ],
                ),
                const Divider(color: Colors.black,height:2,),
                const SizedBox(height: 8,),
                GetBuilder<TabBarControll>(builder: (_)=> HorizentalList(listData: _tabcontroller.categorizeNewBrand),),

                // *************************All Brands title*******************************************************

              Container(
                margin: const EdgeInsets.symmetric(vertical:24),
                padding: const EdgeInsets.symmetric(horizontal:5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text("برندها",style: TextStyle(fontSize:13, fontWeight: FontWeight.w900),),

                    SizedBox(height: 5,),
                    Divider(
                      height: 2,
                      thickness: 1,
                      indent: 10,

                      endIndent: 10,
                      color: Colors.black12,
                    ),
                  ],
                ),
              ),
                // *************************All Brands title End*******************************************************


                GetBuilder<TabBarControll>(builder:(_) => AllBrandsGrid(GridData:_tabcontroller.categorizedAllBrand ,)),
              ],
            ),
          );
        }),
      )
    );
  }
}
