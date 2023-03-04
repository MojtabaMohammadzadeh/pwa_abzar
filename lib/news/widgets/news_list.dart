



import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


import '../model/News_model.dart';
import 'news_modal.dart';

class NewsList extends StatelessWidget {
    List<NewsModel> newsList;
   NewsList({Key? key, required this.newsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context, builder: (context)=>NewsModal(title: newsList[index].title??"", description:newsList[index].description??"",) );
            },
            child: Container(
              width: 80.w,
              constraints: BoxConstraints(
                minHeight: 15.h
              ),

              margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xfff5f5f5),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  //background color of box
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 3, // soften the shadow
                    spreadRadius: 1, //extend the shadow
                    offset: const Offset(
                      2, // Move to right 10  horizontally
                      3, // Move to bottom 10 Vertically
                    ),
                  ),

                ],

              ),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(newsList[index].title??"",style:const TextStyle(fontSize:14, fontWeight:FontWeight.w700),
                    textDirection:TextDirection.rtl,
                    textAlign:TextAlign.center,
                  ),
                  const SizedBox(height: 16,),

                ],
              )
            ),
          );
        });
  }
}