



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../model/last_price.dart';

class LastPriceWidget extends StatelessWidget {
  List<LastPrices> lastPriceData;
  LastPriceWidget({Key? key,required this.lastPriceData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.h,
      width: 100.w,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          SizedBox(
            height: 10.h,
            width: 100.w,

            child: LazyLoadScrollView(

              onEndOfPage: () {  },
              scrollOffset: 5,
              child: ListView.builder(
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: lastPriceData.length,
                  itemBuilder: (context,index){
                    return Container(
                      margin: const EdgeInsets.only(right: 5),
                      width:25.w,
                      height: 10.h,
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide( //                   <--- right side
                            color: Colors.black12,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Text(lastPriceData[index].name?? '',style: const TextStyle(fontSize: 14, fontWeight:FontWeight.w700),),
                          const SizedBox(height: 5,),
                          const Divider(
                            height: 2,
                            thickness: 1,
                            indent: 10,

                            endIndent: 10,
                            color: Colors.black12,
                          ),
                          const SizedBox(height: 5,),
                          Directionality(textDirection: TextDirection.rtl,
                            child:Text(lastPriceData[index].price?? '', style: const TextStyle(fontSize: 14),),),

                        ],
                      ),
                    );
                  }),
            ),
          )

        ],
      ),
    );
  }
}
