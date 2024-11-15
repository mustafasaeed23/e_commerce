// ignore_for_file: unused_field, prefer_final_fields

import 'package:e_commerce/core/theme/my_theme.dart';
import 'package:e_commerce/featuers/home/presentation/widgets/home_tab.dart';
import 'package:e_commerce/featuers/home/presentation/widgets/nav_bar_icon.dart';
import 'package:e_commerce/featuers/products/presentation/widgets/products_screen.dart';
import 'package:e_commerce/featuers/profile/presentation/screens/profile_screen.dart';
import 'package:e_commerce/featuers/wishlist/presentation/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _tabs = const [
    HomeTab(),
    ProductsScreen(),
    WishListScreen(),
    ProfileScreen(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(15.r),
          topEnd: Radius.circular(15.r),
        ),
        child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
                onTap: (index) => setState(() => _currentIndex = index),
                showUnselectedLabels: true,
                items: [
                  BottomNavigationBarItem(
                    backgroundColor: MyTheme.mainColor,
                    icon: NavBarIcon(
                        imagePath: "assets/icons/home_icon.png",
                        isSelected: _currentIndex == 0),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: NavBarIcon(
                        imagePath: "assets/icons/menu_icon.png",
                        isSelected: _currentIndex == 1),
                    label: "Menu",
                  ),
                  BottomNavigationBarItem(
                    icon: NavBarIcon(
                        imagePath: "assets/icons/heart_icon.png",
                        isSelected: _currentIndex == 2),
                    label: "Wishlist",
                  ),
                  BottomNavigationBarItem(
                    icon: NavBarIcon(
                        imagePath: "assets/icons/profile_icon.png",
                        isSelected: _currentIndex == 3),
                    label: "Account",
                  ),
                ])),
      ),
      body: _tabs[_currentIndex],
    );
  }
}
