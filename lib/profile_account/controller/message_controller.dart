



import 'package:get/get.dart';

import '../model/messages/message.dart';
import '../remote/message_remote.dart';

class MessageController extends GetxController{

  var messageList = <Message>[];

@override
  void onInit() {
    // TODO: implement onInit
  fetchMessage();
    super.onInit();

  }


  void fetchMessage() async{

    var response = await MessageRemote.fetchMessage();

    if (response != null){

      response.message?.forEach((element) {
        messageList.add(element);

        update();
      });

    }

  }


}