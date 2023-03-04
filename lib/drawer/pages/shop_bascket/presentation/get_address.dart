



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants.dart';
import '../../../../main_nav_page/presentation/main_nav_page.dart';
import '../controller/get_addres_controller.dart';
import '../widgets/new_address_widget.dart';

class GetAddress extends StatefulWidget {
   GetAddress({Key? key}) : super(key: key);

  @override
  State<GetAddress> createState() => _GetAddressState();
}

class _GetAddressState extends State<GetAddress> {
  AddressController _addressController = Get.put(AddressController());
  late List<bool> _isChecked;

  final List<String> _texts = [
    "","","","","","","","","","","","","","","","","","","","","","","","",
    "","","","","","","","","","","","","","","","","","","","","","","","",
  ];


  @override
  void initState() {
    // TODO: implement initState
    _addressController.GetAddress();
    _isChecked = List<bool>.filled(_texts.length, false);
    super.initState();
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('انتخاب آدرس'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.home_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Get.offAll(MainNavPage());
              // do something
            },
          )
        ],

      ),

      body: RefreshIndicator(
        onRefresh: ()=>_addressController.GetAddress(),
        child: GetBuilder<AddressController>(
          builder: (_){
            return Column(
              children: [

                const NewAddress(),
                (_addressController.addressList.isEmpty)?

                Obx(() => Text((_addressController.isError.isFalse)?"آدرس شما در سیستم ثبت نشده است.\n لطفا آدرس خود را وارد نمایید.":"",
                  style: const TextStyle(fontSize: 14),
                  textDirection:TextDirection.rtl,textAlign: TextAlign.center,))
                :
                Obx(()=>Text((_addressController.isError.isFalse)?"لطفا یکی از آدرس\u200cهای زیر را انتخاب کنید.\n یا آدرس جدید خود را اضافه کنید.":"",
                  style: const TextStyle(fontSize: 14),
                  textDirection:TextDirection.rtl
                  ,textAlign: TextAlign.center,
                ),),
                const SizedBox(height: 16,),
                Obx((){
                  return (_addressController.isError.isFalse)?
                  Expanded(child: ListView.builder(
                      itemCount: _addressController.addressList.length,
                      itemBuilder: (context,index){
                        return Container(
                          width: 100.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                              color: grayWhiteColor,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          child:Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              children: [

                                Checkbox(value:  _isChecked[index],
                                    onChanged: (context){
                                      _addressController.selectAddress(index);
                                      setState(
                                            () {
                                          _isChecked = List<bool>.filled(_texts.length, false);
                                          _isChecked[index] = context!;
                                        },
                                      );


                                    }),
                                const SizedBox(width: 16,),
                                Text(_addressController.addressList[index].address??""),
                                const Expanded(child: SizedBox()),
                                IconButton(onPressed: (){

                                  _addressController.deleteAddress(index);
                                }
                                    , icon:Icon(Icons.delete_forever,color:ravenColor.withOpacity(0.8),size: 25,))
                              ],
                            ),
                          ),
                        );
                      })):
                  Expanded(
                    child: Container(
                      width: 100.w,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child:
                      Column(
                        children: [
                          const SizedBox(height: 32,),
                          Text(_addressController.ErrorMsg.value,
                            style: const TextStyle(fontSize: 13, fontWeight:FontWeight.w700,color:redSecondaryColor),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 32,),
                          GestureDetector(
                            onTap: (){
                              Get.offAll(MainNavPage());
                            },
                            child: Container(
                              width: 100.w,
                              margin: const EdgeInsets.symmetric(horizontal: 16),
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                border: Border.all(color: ravenColor, width: 1),
                                borderRadius: BorderRadius.circular(8)
                              ),
                              child: const Text("بازگشت به صفحه اصلی",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: whitePrimaryColor),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),

                          Obx((){
                            return Center(child: Text(_addressController.url.value),);
                          })
                        ],
                      )
                    ),
                  );
                }),

                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    height: 48,
                    child:SizedBox.expand(
                      child: Obx((){
                        return ElevatedButton(
                            onPressed:(_addressController.isError.isFalse)? (){
                              _addressController.CompleteShop();
                            }: (){},
                            style: ButtonStyle(

                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),

                                    )
                                ),
                                backgroundColor:  MaterialStateProperty.all((_addressController.isError.isFalse)?primaryColor:metalColor),

                                textStyle:
                                MaterialStateProperty.all(const TextStyle(fontSize: 13, fontWeight:FontWeight.w700,fontFamily:"Dana"))),
                            child: const Text("رفتن به درگاه پرداخت"));
                      }),
                    )
                ),

              ],
            );
          },
        ),
      )
    );
  }
}
