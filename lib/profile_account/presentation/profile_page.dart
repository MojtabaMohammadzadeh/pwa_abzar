

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pwa2_abzar_sanat/profile_account/presentation/profile_edit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';




import '../../core/constants.dart';

import '../../drawer/drawer.dart';
import '../../splash_screen/presentation/splash_screen_presentation.dart';
import '../../splash_screen/splash_controller/splash_controller.dart';
import '../controller/user_profile_controller.dart';
import '../widgets/messages.dart';


class ProfilePage extends StatelessWidget {



  ProfileController _profileController = Get.put( ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: const Text('صنعت ابزار',style: TextStyle(fontWeight:FontWeight.w500)),
        backgroundColor: primaryColor,
      ),
      endDrawer:  EndDrawer(),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){Get.to(()=> const ProfileEdit());},
                    child: const Text("ویرایش", style: TextStyle(fontFamily: "Dana",fontSize:13, color: primaryColor ),),
                  ),
                  const Expanded(child: SizedBox()),
                  GetBuilder<ProfileController>(builder: (_){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        (_profileController.name.length> 2)?
                        Text("${_profileController.name} ${_profileController.family}",style: TextStyle(fontFamily: "Dana",fontSize: 13,fontWeight: FontWeight.w900),)
                        :const Text("نام و نام خانوادگی",style: TextStyle(fontFamily: "Dana",fontSize: 13,fontWeight: FontWeight.w900),)
                        ,
                        (_profileController.phoneNumber.length> 2)?
                        Text(_profileController.phoneNumber,style: const TextStyle(fontFamily: "DanaFaNum",fontSize: 13,fontWeight: FontWeight.w700,color: metalColor),)
                        :const Text("شماره تماس",style: TextStyle(fontFamily: "DanaFaNum",fontSize: 13,fontWeight: FontWeight.w700,color: metalColor),)
                        ,
                      ],
                    );
                  }),
                  const SizedBox(width: 16,),
                  // SmallProfilePic(sizeofBox: 40,),
                ],
              ),
              const SizedBox(height: 16,),
              const Divider(height: 2, color: metalColor,),

              Expanded(child: Messages(),),
              const SizedBox(height: 16,),


              GestureDetector(
                onTap: (){
                  _showModalDialog(context,);


                },
                child: Row(
                  children: [

                    const Expanded(child: SizedBox()),
                    const Text("خروج از حساب کاربری‌",style: TextStyle(fontFamily: "Dana",fontSize: 13,color:secondaryColor),),
                    Container(
                      width: 24,
                      height: 24,
                      margin: const EdgeInsets.only(left: 8),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/img/exitIcon.png"),
                          )
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 32,)
            ],
          ),
        ),
      ),
    );
  }
}


_showModalDialog(context,){
  showDialog(
      context: context,
      builder: (BuildContext context) {
        AuthenticationManager _authenticationManager = Get.find();
        return Dialog(
          backgroundColor: Colors.black.withOpacity(0.0),
          child: Container(
            constraints: BoxConstraints(
              maxHeight: 30.h
            ),

            decoration: BoxDecoration(
                color: lightGrayColor,
                borderRadius: BorderRadius.circular(16)
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  const SizedBox(height: 20,),
                  const Text("آیا از خروج خود مطمئن هستید؟",textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: "Dana",fontSize: 16),),
                  const SizedBox(height: 32,),

                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      height: 48,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: (){

                                Navigator.pop(context);
                              },
                              style: ButtonStyle(

                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0),

                                      )
                                  ),
                                  backgroundColor:  MaterialStateProperty.all(primaryColor),

                                  textStyle:
                                  MaterialStateProperty.all(const TextStyle(fontSize: 13, fontWeight:FontWeight.w700,fontFamily:"Dana"))),
                              child: const Text("خیر")),
                          ElevatedButton(
                              onPressed: (){

                                _authenticationManager.logOut();
                                Get.offAll(()=>SplashScreen());
                              },
                              style: ButtonStyle(

                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0),

                                      )
                                  ),
                                  backgroundColor:  MaterialStateProperty.all(primaryColor),

                                  textStyle:
                                  MaterialStateProperty.all(const TextStyle(fontSize: 13, fontWeight:FontWeight.w700,fontFamily:"Dana"))),
                              child: const Text("بله"))
                        ],
                      )
                  ),
                  const SizedBox(height: 16,),
                ],
              ),
            ),
          ),
        );
      });
}