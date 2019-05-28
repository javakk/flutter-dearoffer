
import 'package:DearOffer/main_page.dart';
import 'package:DearOffer/pages/home/home_page.dart';
import 'package:DearOffer/pages/welcome/welcome_page.dart';
import 'package:DearOffer/splash.dart';
import 'package:flutter/material.dart';
import 'package:DearOffer/pages/mine/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(App());

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


