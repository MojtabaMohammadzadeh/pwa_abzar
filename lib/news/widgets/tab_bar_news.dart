

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class buildTabbarNews extends StatelessWidget {
  buildTabbarNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 35.0,
      margin: const EdgeInsets.only(top: 16, right: 10),
      child: ListView.builder(
          reverse: true,
          // itemCount: categoriesData.length
          itemCount: 25,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
              },
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff182f41),

                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: const Text(
                  'عنوان' , // categoriesData[index].title,
                  style: TextStyle(
                    color:  Colors.white,

                  ),
                ),
              ),
            );
          }) ,
    );

  }
}
