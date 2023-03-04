




import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../category/presentation/category.dart';
import '../../core/constants.dart';
import '../../home/presentation/home.dart';
import '../../news/presentation/news_of_sanat.dart';
import '../../shop/presentation/shop_of_sanat.dart';

class MainNavPage extends StatefulWidget {
  const MainNavPage({Key? key}) : super(key: key);

  @override
  State<MainNavPage> createState() => _MainNavPageState();
}

class _MainNavPageState extends State<MainNavPage> {
  late PersistentTabController _controller;

  @override
  void initState() {
    // TODO: implement initState

    _controller = PersistentTabController(initialIndex: 3);

    super.initState();
  }

  List<Widget> _buildScreens() {
    return [

      NewsOfSanat( ),
      Category( ),
      ShopOfSanat(),
      Home(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [

      PersistentBottomNavBarItem(
        icon: Icon(Icons.newspaper_outlined),

        title: "اخبار",
        activeColorPrimary: redSecondaryColor,
        inactiveColorPrimary:  Colors.black45,

      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.category_outlined),
        title: ("دسته بندی"),
        activeColorPrimary: redSecondaryColor,
        inactiveColorPrimary: Colors.black45,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shop_outlined),
        title: ("فروشگاه"),
        activeColorPrimary: redSecondaryColor,
        inactiveColorPrimary: Colors.black45,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_outlined),
        title: ("خانه"),
        activeColorPrimary: redSecondaryColor,
        inactiveColorPrimary: Colors.black45,
      ),


    ];
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView.custom(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        itemCount: 4,
        handleAndroidBackButtonPress: false,
        stateManagement: true,
        // hideNavigationBar: _hideNavBar,
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        customWidget: (navBarEssentials) => CustomNavBarWidget(
          items: _navBarsItems(),
          onItemSelected: (index) {
            setState(() {
              navBarEssentials.onItemSelected!(index);
            });
          },
          selectedIndex: _controller.index,
        ),
      ),
    );
  }
}



class CustomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;

  CustomNavBarWidget({

    required this.selectedIndex,
    required this.items,
    required this.onItemSelected,
  });

  Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      height: kBottomNavigationBarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: IconTheme(
              data: IconThemeData(
                  size: 26.0,
                  color: isSelected
                      ? (item.activeColorSecondary == null
                      ? item.activeColorPrimary
                      : item.activeColorSecondary)
                      : item.inactiveColorPrimary == null
                      ? item.activeColorPrimary
                      : item.inactiveColorPrimary),
              child: isSelected ? item.icon : item.inactiveIcon ?? item.icon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Material(
              type: MaterialType.transparency,
              child: FittedBox(
                child: Text(
                  item.title ?? '',
                  style: TextStyle(
                      color: isSelected
                          ? (item.activeColorSecondary == null
                          ? item.activeColorPrimary
                          : item.activeColorSecondary)
                          : item.inactiveColorPrimary,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DoubleBackToCloseApp(
        snackBar: SnackBar(
          backgroundColor: primaryColor,
          behavior: SnackBarBehavior.floating,
          duration: Duration(milliseconds: 800),
          margin: EdgeInsets.only(bottom: 100, right: 32, left: 32),
          content: Container(
              width: 100.w,
              height: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Center(child: Text('برای خروج دوباره کلیک کن',style: TextStyle(fontFamily: "Dana",fontSize: 13,color: grayWhiteColor, fontWeight: FontWeight.w700),textAlign:TextAlign.center,))),
        ),
      child:Container(
        color: Colors.white,
        child: Container(
          width: double.infinity,
          height: kBottomNavigationBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items.map((item) {
              int index = items.indexOf(item);
              return Expanded(
                child: InkWell(
                  onTap: () {
                    this.onItemSelected(index);
                  },
                  child: _buildItem(item, selectedIndex == index),
                ),
              );
            }).toList(),
          ),
        ),
      )
    );
  }
}