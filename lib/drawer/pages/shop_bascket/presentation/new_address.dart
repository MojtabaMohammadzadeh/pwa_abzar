



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants.dart';
import '../../../../main_nav_page/presentation/main_nav_page.dart';
import '../remote/new_address.dart';
import 'get_address.dart';

class NewAddressForm extends StatefulWidget {
  NewAddressForm({Key? key}) : super(key: key);

  @override
  State<NewAddressForm> createState() => _NewAddressFormState();
}

class _NewAddressFormState extends State<NewAddressForm> {
  TextEditingController _address = TextEditingController();

  TextEditingController  _postalCodeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _postalCodeController.text = '********';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('ایجاد آدرس جدید'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.home_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Get.off(MainNavPage());
              // do something
            },
          )
        ],

      ),

      body: Column(
        children: [
          Expanded(child: ListView(
            children: [
              const SizedBox(height: 25,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text("آدرس خود را وارد کنید.",
                  style: TextStyle(fontSize: 15,),
                  textDirection:TextDirection.rtl,
                ),
              ),
              const SizedBox(height: 16,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.symmetric(horizontal: 16),

                width: 95.w,
                height: 30.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: metalColor,width: 1)
                ),
                child:  TextField(
                  controller: _address,
                  minLines: 1,
                  maxLines: 8,
                  textDirection: TextDirection.rtl,
                  decoration: const InputDecoration(
                      hintText: 'آدرس ',
                      hintTextDirection: TextDirection.rtl,
                      border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 32,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text("کدپستی خود را وارد کنید.(اختیاری)",
                  style: TextStyle(fontSize: 15,),
                  textDirection:TextDirection.rtl,
                ),
              ),
              SizedBox(height: 16,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: _postalCodeController,
                  onChanged:(content){}  ,
                  keyboardType: TextInputType.phone,
                  autocorrect: false,


                  style: const TextStyle(
                      fontSize:13,
                      fontFamily: "DanaFaNum",
                      fontWeight: FontWeight.w900
                  ),
                  decoration: const InputDecoration(
                    hintText: "کد پستی",
                    hintStyle: TextStyle(color:metalColor,fontSize:16,fontWeight:FontWeight.w400),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                          color:metalColor,
                          width: 2,
                        )
                    ),
                  ),
                ),
              )
            ],
          )),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: 48,
              child:SizedBox.expand(
                child: ElevatedButton(
                    onPressed: () async{
                      var response = await NewAdressRemote.fetchNewAddress(_postalCodeController.text,_address.text);
                      if(response == true){
                        Get.offAll(()=>GetAddress());
                      }
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
                    child: const Text("ثبت آدرس")),
              )
          ),
        ],
      ),
    );
  }
}
