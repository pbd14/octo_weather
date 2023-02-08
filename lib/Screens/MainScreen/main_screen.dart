import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:weather/Screens/HomeScreen/home_screen.dart';
import 'package:weather/Widgets/loading_screen.dart';
import 'package:weather/app_route.gr.dart' as app_route;
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/material.dart';
import 'package:weather/constants.dart';

// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  int tabNum;
  MainScreen({
    Key? key,
    this.tabNum = 0,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int? tabNum;
  bool loading = false;
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      // FavouritesScreen(),
      // CourseScreen(),
      HomeScreen(),
      // LoginScreen(),
    ];
  }

  void changeTabNumber(int number) {
    _controller.jumpToTab(number);
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.house_alt_fill),
        iconSize: 20,
        title: ("Home"),
        activeColorPrimary: primaryColor,
        activeColorSecondary: whiteColor,
        inactiveColorPrimary: lightPrimaryColor,
        textStyle: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            color: darkDarkColor,
            // fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.house_alt_fill),
        iconSize: 20,
        title: ("Home"),
        activeColorPrimary: primaryColor,
        activeColorSecondary: whiteColor,
        inactiveColorPrimary: lightPrimaryColor,
        textStyle: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            color: darkDarkColor,
            // fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    //   PersistentBottomNavBarItem(
    //     icon: const Icon(CupertinoIcons.star),
    //     iconSize: 20,
    //     title: ("Favourite"),
    //     activeColorPrimary: primaryColor,
    //     activeColorSecondary: whiteColor,
    //     inactiveColorPrimary: lightPrimaryColor,
    //     textStyle: GoogleFonts.montserrat(
    //       textStyle: const TextStyle(
    //         color: darkDarkColor,
    //         // fontSize: 20,
    //         fontWeight: FontWeight.w700,
    //       ),
    //     ),
    //   ),
    //   PersistentBottomNavBarItem(
    //     icon: const Icon(CupertinoIcons.book_fill),
    //     iconSize: 20,
    //     title: ("Course"),
    //     activeColorPrimary: primaryColor,
    //     activeColorSecondary: whiteColor,
    //     inactiveColorPrimary: lightPrimaryColor,
    //     textStyle: GoogleFonts.montserrat(
    //       textStyle: const TextStyle(
    //         color: darkDarkColor,
    //         // fontSize: 20,
    //         fontWeight: FontWeight.w700,
    //       ),
    //     ),
    //   ),
    //   PersistentBottomNavBarItem(
    //     icon: const Icon(CupertinoIcons.bell),
    //     iconSize: 20,
    //     title: ("Notifications"),
    //     activeColorPrimary: primaryColor,
    //     activeColorSecondary: whiteColor,
    //     inactiveColorPrimary: lightPrimaryColor,
    //     textStyle: GoogleFonts.montserrat(
    //       textStyle: const TextStyle(
    //         color: darkDarkColor,
    //         // fontSize: 20,
    //         fontWeight: FontWeight.w700,
    //       ),
    //     ),
    //   ),
    //   PersistentBottomNavBarItem(
    //     icon: const Icon(CupertinoIcons.person),
    //     iconSize: 20,
    //     title: ("Profile"),
    //     activeColorPrimary: primaryColor,
    //     activeColorSecondary: whiteColor,
    //     inactiveColorPrimary: lightPrimaryColor,
    //     textStyle: GoogleFonts.montserrat(
    //       textStyle: const TextStyle(
    //         color: darkDarkColor,
    //         // fontSize: 20,
    //         fontWeight: FontWeight.w700,
    //       ),
    //     ),
    //   ),
    ];
  }

  @override
  void initState() {
    tabNum = widget.tabNum;
    if (widget.tabNum != 0) {
      _controller.jumpToTab(widget.tabNum);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const LoadingScreen()
        : PersistentTabView(
            context,
            controller: _controller,
            screens: _buildScreens(),
            items: _navBarsItems(),
            navBarHeight: 70,
            confineInSafeArea: true,
            backgroundColor: whiteColor, // Default is Colors.white.
            handleAndroidBackButtonPress: true, // Default is true.
            resizeToAvoidBottomInset:
                true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: true, // Default is true.
            hideNavigationBarWhenKeyboardShows:
                true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(20.0),
              colorBehindNavBar: backgroundColor,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style7,
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          );

    // AutoTabsScaffold(
    //         routes: [
    //           app_route.HomeScreen(),
    //           app_route.HomeScreen(),
    //           app_route.HomeScreen(),
    //         ],
    //         bottomNavigationBuilder: (_, tabsRouter) {
    //           return BottomNavigationBar(
    //             elevation: 10,
    //             backgroundColor: darkPrimaryColor,
    //             selectedItemColor: secondaryColor,

    //             currentIndex: tabsRouter.activeIndex,
    //             onTap: tabsRouter.setActiveIndex,
    //             items: [
    //               const BottomNavigationBarItem(
    //                 label: 'Home',
    //                 icon: Icon(CupertinoIcons.home),
    //               ),
    //             ],
    //           );
    //         },
    //       );
  }
}
