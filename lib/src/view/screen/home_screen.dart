import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:e_commerce_flutter/core/app_data.dart';
import 'package:e_commerce_flutter/src/view/screen/cart_screen.dart';
import 'package:e_commerce_flutter/src/view/widget/page_wrapper.dart';
import 'package:e_commerce_flutter/src/view/screen/profile_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/favorite_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/product_list_screen.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const List<Widget> screens = [
    ProductListScreen(),
    FavoriteScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          items: AppData.bottomNavyBarItems
              .map(
                (item) => BottomNavigationBarItem(
              icon: item.icon,
              label: item.title,
              backgroundColor: item.inActiveColor,
              activeIcon: item.icon, // Use the same icon for active state
            ),
          )
              .toList(),
          onTap: (currentIndex) {
            setState(() {
              _currentIndex = currentIndex;
            });
          },
          selectedItemColor: Colors.blue, // Change the selected item color here
          unselectedItemColor: Colors.grey, // Change the unselected item color here
          showUnselectedLabels: true, // Set to false if you don't want labels for unselected items
        ),
        body: PageTransitionSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (
              Widget child,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              ) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: HomeScreen.screens[_currentIndex],
        ),
      ),
    );
  }
}
