import 'package:ecommerce_app/page/home.dart';
import 'package:ecommerce_app/page/login.dart';
import 'package:ecommerce_app/page/product.dart';
import 'package:ecommerce_app/page/register.dart';
import 'package:ecommerce_app/util/const.dart';
import 'package:flutter/material.dart';

import 'page/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    RegisterPage.tag: (context) => RegisterPage(),
    HomePage.tag: (context) => HomePage(),
    MainPage.tag: (context) => MainPage(),
    ProductPage.tag: (context) => ProductPage(),
  };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
      home: LoginPage(),
      routes: routes,
    );
  }
}
