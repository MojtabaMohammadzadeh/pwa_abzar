




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pwa2_abzar_sanat/drawer/pages/about_us/about_us.dart';
import 'package:pwa2_abzar_sanat/drawer/pages/contact_us/contact_us.dart';
import 'package:pwa2_abzar_sanat/drawer/pages/favorites/favorites_page.dart';
import 'package:pwa2_abzar_sanat/drawer/pages/new_shop/presentation/new_shop_page.dart';
import 'package:pwa2_abzar_sanat/drawer/pages/order_page/order_page.dart';
import 'package:pwa2_abzar_sanat/drawer/pages/shop_bascket/presentation/shop_bascket.dart';
import '../core/constants.dart';
import '../home/contrroller/home_controller.dart';
import '../profile_account/controller/user_profile_controller.dart';
import '../profile_account/presentation/profile_page.dart';

class EndDrawer extends StatelessWidget {
   EndDrawer({Key? key}) : super(key: key);
   ProfileController _profileController = Get.put(ProfileController());
   final TabBarControll _tabcontroller = Get.find();
  @override
  Widget build(BuildContext context) {
//Header of Drawer
    Widget buildHeader(BuildContext context) => Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top
      ),
      color: primaryColor,
      child: Column(
        children:  [

          const SizedBox(height: 15,),
          Text('${_profileController.name} ${_profileController.family}',style: TextStyle(color:grayWhiteColor,fontWeight: FontWeight.w700,fontSize: 13),),
          const SizedBox(height: 15,),


        ],
      ),
    );

    //Items of Drawer
    Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(

          children: [

            ListTile(
                leading: const Icon(Icons.person_pin_outlined),
                title: const Text('پروفایل کاربری'),
                onTap: (){
                  Get.to( ()=> ProfilePage());
                }
            ),
            ListTile(
                leading: const Icon(Icons.shopping_bag_outlined),
                title: const Text('لیست سفارشات'),
                onTap: (){
                  Get.to( ()=> OrderPage());
                }
            ),
            ListTile(
                leading: const Icon(Icons.favorite_outline),
                title: const Text('علاقه مندی ها'),
                onTap: (){
                  Get.to(()=>FavoritesPage());
                }
            ),
            ListTile(
                leading: const Icon(Icons.store_outlined),
                title: const Text('ثبت رایگان فروشگاه شما'),
                onTap: (){
                  Get.to(NewShopPage());
                }
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart_outlined),
              title: const Text('سبد خرید'),
              onTap: (){
                Get.to(ShopBascket());
              },

            ),

            ListTile(
              leading: const Icon(Icons.contact_mail_outlined),
              title: const Text('درباره ما'),

              onTap: (){
                Get.to( AboutUsPage());
              },

            ),
            ListTile(
              leading: const Icon(Icons.contact_mail_outlined),
              title: const Text('تماس با پشتیبانی'),
              onTap: (){
                Get.to(ContactUsPage());
              },

            ),



          ],
        ),
      ),
    );


    return Drawer(

      child:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );


  }

   }


