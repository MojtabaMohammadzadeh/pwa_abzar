


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../profile_account/controller/user_profile_controller.dart';

class SmallProfilePic extends StatelessWidget {
  final double sizeofBox;
   SmallProfilePic({Key? key, required this.sizeofBox}) : super(key: key);
  ProfileController _imgController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
            width: sizeofBox,
            height: sizeofBox,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(sizeofBox/2),
                image: const DecorationImage(
                  image: AssetImage("assets/img/image3.png") ,
                  fit: BoxFit.fill,
                )
            ),
          );


  }
}
