import 'package:flutter/material.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("ECommerce App"),),
      ),
    );
  }
}