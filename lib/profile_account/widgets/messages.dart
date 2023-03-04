








import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


import '../../core/constants.dart';
import '../controller/message_controller.dart';

class Messages extends StatelessWidget {
  Messages({Key? key}) : super(key: key);

  MessageController _messageController = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: GetBuilder<MessageController>(
                builder: (_){
                  return(_messageController.messageList.length>0)? ListView.builder(
                      itemCount: _messageController.messageList.length,
                      itemBuilder:(context, index){
                        return Container(
                          width: 100.w,
                          height: 20.h,
                          margin: const EdgeInsets.symmetric(horizontal: 0,vertical: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: grayWhiteColor,
                          ),
                          child:Column(
                            children: [
                              Row(
                                children: [
                                  Text(_messageController.messageList[index].title ??"" , style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700,),),
                                ],),
                              const Divider(height: 3,color:metalColor,),
                              const SizedBox(height: 16),
                              Text(_messageController.messageList[index].content ?? "",style:TextStyle(fontSize: 13),overflow:TextOverflow.fade,maxLines: 1,),
                              const Expanded(child: SizedBox()),
                              Row(
                                children: [
                                  const Expanded(child: SizedBox()),
                                  GestureDetector(
                                    onTap: (){

                                      showDialog(context: context,
                                          builder: (context){
                                            return Container(

                                              height: 172,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(12)
                                              ),
                                              child: AlertDialog(
                                                title:Column(
                                                  children: [
                                                    Text(_messageController.messageList[index].title ??"",style:TextStyle(fontSize: 14,fontWeight:FontWeight.w700),textDirection:TextDirection.rtl,textAlign: TextAlign.center,),
                                                    const Divider(height: 2,color: metalColor,),
                                                    const SizedBox(height: 16,),
                                                    Text(_messageController.messageList[index].content ?? "",style:TextStyle(fontSize: 13),textDirection:TextDirection.rtl,textAlign: TextAlign.center,),
                                                    const SizedBox(height: 16,),
                                                    Row(
                                                      children: [

                                                        Text(_messageController.messageList[index].createdAt2 ?? "",style:TextStyle(fontSize: 10),textDirection:TextDirection.rtl,textAlign: TextAlign.center,),
                                                        const Expanded(child: SizedBox()),
                                                      ],
                                                    )

                                                  ],
                                                ),

                                                actions: [
                                                   Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [
                                                      TextButton(onPressed: (){Navigator.pop(context);}, child: Text("مطالعه کردم",style:TextStyle(fontSize: 13,fontWeight: FontWeight.w700))),


                                                    ],
                                                  )

                                                ],
                                              ),
                                            );
                                          });

                                    },
                                    child: const Text('بیشتر...',style: TextStyle(fontSize:13, fontWeight:FontWeight.w700,color: primaryColor),),
                                    
                                  ),

                                ],
                              )

                            ],
                          ) ,
                        );
                      } ): const Center(child: Text("در حال حاضر صندوق پیام\u200cهای شما خالی می\u200cباشد."),);
                },
              ),
            ))
      ],
    );
  }
}
