


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../core/constants.dart';
import '../../main_nav_page/presentation/main_nav_page.dart';
import '../../shop/controller/voilet_controller.dart';

class Violation extends StatelessWidget {
  final int id_product;
  Violation({Key? key, required this.id_product}) : super(key: key);

  VioletController _violetController = Get.put(VioletController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('ثبت تخلف', style:TextStyle(fontSize:14),),
        centerTitle: true,

      ),


      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(

          children: [
            const SizedBox(height: 16,),
            const Text("اگر فروشگاه مورد نظر تخلفی انجام داده، لطفا گزارشش رو برای ما بنویسید تا در اسرع وقت پیگیری کنیم.",
            style: TextStyle(fontSize: 13, color: metalColor),textDirection:TextDirection.rtl,textAlign: TextAlign.center,),
            const SizedBox(height: 16,),
            Container(

              padding: const EdgeInsets.all(8),
            child: TextField(
              maxLines:8,

              keyboardType: TextInputType.multiline,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.start,
              //or null
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                        color: Colors.red,
                        width: 5.0),
                  ),
                  hintTextDirection: TextDirection.rtl,
                  hintText: "گزارش تخلف ..."),
            ),
            ),

            const SizedBox(height: 16,),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                height: 48,
                child:SizedBox.expand(
                  child: ElevatedButton(
                      onPressed: (){
                        _violetController.SendReport(id_product.toString());
                     showDialog(context: context,
                      builder: (context){
                       return SizedBox(
                       width: 100.w,
                        height: 172,

                        child: AlertDialog(
                         title: const Text("گزارش شما با موفقیت ثبت شد. در اولین فرصت همکاران ما با شما تماس خواهند گرفت.",textDirection:TextDirection.rtl,textAlign:TextAlign.center,),
                           actions: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 ElevatedButton(onPressed: (){

                                   Get.off(()=> MainNavPage());

                                 },
                                     style: ButtonStyle(
                                         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                             RoundedRectangleBorder(
                                               borderRadius: BorderRadius.circular(12.0),

                                             )
                                         ),
                                         backgroundColor: MaterialStateProperty.all(primaryColor),
                                         padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 16, vertical: 14)),
                                         textStyle:
                                         MaterialStateProperty.all(const TextStyle(fontSize: 13, fontWeight:FontWeight.w700,fontFamily:"Dana"))),
                                     child: const Text("بازگشت به صفحه اصلی",style: TextStyle(fontSize:13, fontWeight: FontWeight.w700,color:whiteColor),))
                               ],
                             )
                                ],
                               ),
                                 );
                                   });
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
                      child: const Text("ثبت نهایی تخلف")),
                )
            ),

          ],
        )
      )





    );
  }
}
