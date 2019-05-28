import 'dart:async';

import 'package:DearOffer/main_page.dart';
import 'package:flutter/material.dart';
import 'package:DearOffer/main.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashState createState() =>  SplashState();
}

class SplashState extends State<SplashPage> {
  Timer _t;

  @override
  void initState() {
    super.initState();
    _t =  Timer(const Duration(milliseconds: 2000), () {
      try {
        Navigator.of(context).pushAndRemoveUntil(
            PageRouteBuilder<Null>(
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return AnimatedBuilder(
                  animation: animation,
                  builder: (BuildContext context, Widget child) {
                    return Opacity(
                      opacity: animation.value,
                      child:  MainPage(title: 'Dear Offer'),
                    );
                  },
                );
              },
              transitionDuration: Duration(milliseconds: 300),
            ),
            (Route route) => route == null);
      } catch (e) {}
    });
  }

  @override
  void dispose() {
    _t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Material(
      color:  Color(0xFF66ccff),
//      color:  Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 300),
            alignment: Alignment(0, -0.3),
            child:  Text(
              "Dear Offer",
              style:  TextStyle(
                  color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment(0, -0.3),
            child:  Text(
              "专注计算机专业校招",
              style:  TextStyle(
                  color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 250),
            alignment: Alignment(0, -0.3),
            child:
              Image.asset("assets/img/ic_launcher.png", width: 50, height: 50,),
          ),
        ],
      )
    );
  }
}
