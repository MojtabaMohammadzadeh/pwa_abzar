






import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants.dart';


class NewsModal extends StatelessWidget {
  final String title;
  final String description;
   NewsModal({Key? key, required this.title, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,

      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 32,),
        Expanded(child: ListView(
          children: [
            SizedBox(height: 32,),
            Text(title ,style: const TextStyle(fontSize: 15, fontWeight:FontWeight.w700),textAlign:TextAlign.center,textDirection:TextDirection.rtl,),
            const SizedBox(height: 15,),
            Container(width:100.w,
              margin: const EdgeInsets.symmetric(horizontal: 16),

              child: Text(description,style: const TextStyle(fontSize: 13,height: 2),textDirection: TextDirection.rtl,textAlign:TextAlign.center,),),
            const SizedBox(height: 15,),
          ],
        )),
        ElevatedButton(onPressed: (){ Navigator.of(context).pop();},
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),

                    )
                ),
                backgroundColor: MaterialStateProperty.all(secondaryColor),
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 16, vertical: 14)),
                textStyle:
                MaterialStateProperty.all(const TextStyle(fontSize: 12, fontWeight:FontWeight.w700,fontFamily:"Dana"))),
            child: const Text("مطالعه کردم")),

        const SizedBox(height: 16),


      ],
    );
  }
}