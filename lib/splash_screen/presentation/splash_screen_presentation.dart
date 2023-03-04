
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../core/constants.dart';
import '../../core/widgets/no_connection.dart';


import '../../home/contrroller/home_controller.dart';
import '../../login/presentation/phone_entry.dart';
import '../../main_nav_page/presentation/main_nav_page.dart';
import '../splash_controller/splash_controller.dart';



class SplashScreen extends StatelessWidget {
  final AuthenticationManager _authmanager = Get.put(AuthenticationManager());
  final TabBarControll _tabcontroller = Get.put(TabBarControll());

  Future<void> initializeSettings() async {

    _authmanager.checkLoginStatus();

    //Simulate other services for 3 seconds
    await Future.delayed(Duration(seconds: 4));
  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else {
          if (snapshot.hasError)
            return errorView(snapshot);
          else
            return OnBoard();
        }

      },
    );
  }



  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(
        body: Center(child: Text('Error: ${snapshot.error}')));
  }

  Scaffold waitingView() {
    return Scaffold(
        body: FadeSplashWidget());
  }
}

// *******************************Part02*******************************************

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager _authManager = Get.find();

    return _authManager.isConnected ? Obx(() {
      return _authManager.isLogged.value ? MainNavPage() : PhoneEntry();
      // return _authManager.isLogged.value ? MainNavPage() : MainNavPage();

    }): NoConnection();
  }

}


// **************************Fade Widget**********************

class FadeSplashWidget extends StatefulWidget {


  @override
  State<FadeSplashWidget> createState() => _FadeSplashWidgetState();
}

class _FadeSplashWidgetState extends State<FadeSplashWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    _animationController =  AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        decoration: BoxDecoration(
          color: Color(0xffF5F5F5),
          image: DecorationImage(
            image: AssetImage("assets/img/bg_splash.jpg"),
            fit: BoxFit.fill,

          )
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                  opacity:_animationController,
                  child: Container(
                    width:150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: AssetImage("assets/img/Logo.png"),
                          fit: BoxFit.fitHeight,
                        )
                    ),
                  ),
              ),
              SizedBox(height: 16,),
              FadeTransition(opacity: _animationController,
              child: Text("ابزار صنعت",
                style:TextStyle(fontSize: 20,
                    fontFamily: "Dana",
                    fontWeight:FontWeight.w700,
                    color:primaryColor),
                textDirection: TextDirection.rtl,),
              ),
              SizedBox(height: 16,),
              FadeTransition(opacity: _animationController,
              child: Text("هدف، برند ه شدن شماست",
                style:TextStyle(fontSize: 16,
                    fontFamily: "Dana",
                    fontWeight:FontWeight.w700,
                    color:ravenColor),
                textDirection: TextDirection.rtl,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



