


import 'package:flutter/cupertino.dart';

class SingleMessage extends StatelessWidget {

  final String message_id;
   SingleMessage({Key? key, required this.message_id}) : super(key: key);


  Future<void> initializeSettings() async {



    //Simulate other services for 3 seconds
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initializeSettings(),
        builder: (context,snapshot){
          return Container();
        });
  }
}
