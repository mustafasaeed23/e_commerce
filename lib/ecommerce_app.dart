import 'package:e_commerce/core/theme/my_theme.dart';
import 'package:e_commerce/featuers/auth/presentation/screens/login_screen.dart';
import 'package:e_commerce/featuers/auth/presentation/screens/register_screen.dart';
import 'package:e_commerce/featuers/cart/Presentation/screens/cart_screen.dart';
import 'package:e_commerce/featuers/home/presentation/screens/home_screen.dart';
import 'package:e_commerce/featuers/home/presentation/widgets/home_tab.dart';
import 'package:e_commerce/featuers/products/presentation/screens/product_details_screen.dart';
import 'package:e_commerce/featuers/products/presentation/widgets/products_screen.dart';
import 'package:e_commerce/featuers/profile/presentation/screens/profile_screen.dart';
import 'package:e_commerce/featuers/wishlist/presentation/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'E-Commerce',
            theme: MyTheme.lightTheme,
            routes: {
              LoginScreen.routeName: (context) => const LoginScreen(),
              RegisterScreen.routeName: (context) => RegisterScreen(),
              HomeScreen.routeName: (context) => const HomeScreen(),
              HomeTab.routeName: (context) => const HomeTab(),
              ProductsScreen.routeName: (context) => const ProductsScreen(),
              // ProductsScreen.routeName: (context) => const ProductsScreen(),
              ProductDetailsScreen.routeName: (context) =>
                  const ProductDetailsScreen(),
              WishListScreen.routeName: (context) => const WishListScreen(),
              ProfileScreen.routeName: (context) => const ProfileScreen(),
              CartScreen.routeName: (context) => const CartScreen(),
            },
            initialRoute: LoginScreen.routeName,
          );
        });
  }
}
