
import 'dart:io';

import 'package:DearOffer/splash.dart';
import 'package:DearOffer/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:DearOffer/pages/mine/login_page.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(App());
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() {

    return _AppState();
  }

}

class _AppState extends State<App> {

  String logined;
  String welcomed;

  Future getInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      welcomed = sp.get("welcomed");
      logined = sp.get("login");
    });
  }


  @override
  Widget build(BuildContext context){

    getInfo();

    Widget page;

    if (welcomed == null) {
      page = WelcomePage();
    } else if (logined == null){
      page = LoginPage();
    } else {
      page = SplashPage();
    }


    return MaterialApp(
      theme: ThemeData(
        primaryIconTheme: const IconThemeData(color: Colors.white),
        brightness: Brightness.light,
        primaryColor: Color(0xFF66ccff),
        accentColor: Color(0xFF66ccff),
      ),
      home: page,
    );
  }
}


