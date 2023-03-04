



import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


import '../../core/constants.dart';
import '../controller/user_edit_controller.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {

  File? _image;
  XFile? pickedFile;
  final ImagePicker _picker = ImagePicker();
  Future<void> getImage() async {
    pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if(pickedFile != null){
      setState(() {
        _image = File(pickedFile!.path);
      });
    }
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _familyController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    UserEditController _usereditController = Get.put(UserEditController());


    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: AppBar(
            elevation: 0,
            backgroundColor: grayWhiteColor,
            iconTheme: const IconThemeData(
              color: Colors.black,
              size: 24.0,
            ),


            actions: [Container(
              margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              child: const Text("ویرایش حساب کاربری",style: TextStyle(
                  fontFamily: "Dana",
                  color:ravenColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w700),),
            )],

          ),
      ),

      body: Center(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Expanded(child: ListView(
                children: [

                  // ***************************Text Field**************************************
                  SizedBox(height: 10.h,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.px),
                    margin: EdgeInsets.symmetric(horizontal: 16.px,vertical:8 ),
                    height: 48.px,

                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextFormField(
                        controller: _nameController,
                        // onChanged:phoneController.textFieldCheck ,
                        keyboardType: TextInputType.text,
                        autocorrect: false,


                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          fontSize:13,
                          fontFamily: "Dana",
                          fontWeight: FontWeight.w900,

                        ),
                        decoration: const InputDecoration(
                          labelText: "نام",
                          labelStyle:TextStyle(color:metalColor,) ,
                          // hintStyle:TextStyle(color:metalColor,),
                          // hintTextDirection: TextDirection.rtl,
                          focusedBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(
                                color:primaryColor,
                                width: 2,
                              )
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(
                                color:metalColor,
                                width: 2,
                              )
                          ),

                        ),
                      ),
                    ),
                  ),

                  // **************************End Text Field **********************************
                  // ***************************Text Field**************************************
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.px),
                    margin: EdgeInsets.symmetric(horizontal: 16.px,vertical:8 ),
                    height: 48.px,

                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextFormField(
                        controller: _familyController,
                        // onChanged:phoneController.textFieldCheck ,
                        keyboardType: TextInputType.text,
                        autocorrect: false,


                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          fontSize:13,
                          fontFamily: "Dana",
                          fontWeight: FontWeight.w900,

                        ),
                        decoration: const InputDecoration(
                          labelText: "نام خانوادگی",
                          labelStyle:TextStyle(color:metalColor,) ,
                          // hintStyle:TextStyle(color:metalColor,),
                          // hintTextDirection: TextDirection.rtl,
                          focusedBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(
                                color:primaryColor,
                                width: 2,
                              )
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(
                                color:metalColor,
                                width: 2,
                              )
                          ),

                        ),
                      ),
                    ),
                  ),

                  // **************************End Text Field **********************************
                  // ***************************Text Field**************************************


                  // **************************End Text Field **********************************
                  Container(
                      width: 100.w,
                      margin: EdgeInsets.symmetric(horizontal: 16.px,vertical: 16.px),
                      child: ElevatedButton(onPressed: (){

                        _usereditController.EditUser(_nameController.text,_familyController.text);

                        if (_image != null){
                          _usereditController.UploadImage(_image!);
                        }

                      },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),

                                  )
                              ),
                              backgroundColor:(true) ? MaterialStateProperty.all(primaryColor): MaterialStateProperty.all(primaryColor),
                              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 38, vertical: 14)),
                              textStyle:
                              MaterialStateProperty.all(const TextStyle(fontSize: 13, fontWeight:FontWeight.w700,fontFamily:"Dana"))),
                          child: const Text("ویرایش کن"))
                  ),
                ],
              ))

            ],
          )


      ),
    );
  }
}
