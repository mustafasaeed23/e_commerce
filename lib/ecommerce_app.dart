import 'package:e_commerce/core/theme/my_theme.dart';
import 'package:e_commerce/featuers/auth/presentation/screens/login_screen.dart';
import 'package:e_commerce/featuers/auth/presentation/screens/register_screen.dart';
import 'package:e_commerce/featuers/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      theme: MyTheme.lightTheme,
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName:(context) =>  RegisterScreen(),
        HomeScreen.routeName:(context)=> const HomeScreen(),

      },
      initialRoute: LoginScreen.routeName,

    );
  }
}
