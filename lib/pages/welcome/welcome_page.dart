import 'package:DearOffer/common/utils/common_util.dart';
import 'package:DearOffer/pages/mine/login_page.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class WelcomePage extends StatelessWidget {
  //making list of pages needed to pass in IntroViewsFlutter constructor.
  final pages = [
    PageViewModel(
        pageColor: const Color(0xFF66ccff),
        bubble: Image.asset('assets/img/welcome_computer.png'),
        body: Text(
          '专注计算机专业就业信息',
        ),
        title: Text(
          'DearOffer',
        ),
        mainImage: Image.asset(
          'assets/img/welcome_computer.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        )),
    PageViewModel(
      pageColor: const Color(0xFF03A9F4),
      iconImageAssetPath: 'assets/img/welcome_technology.png',
      body: Text(
        '由Google开源移动UI框架Flutter快速在iOS和Android上构建高质量的原生用户界面',
      ),
      title: Text('技术介绍'),
      mainImage: Image.asset(
        'assets/img/welcome_technology.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    PageViewModel(
      pageColor: const Color(0xFF66ccff),
      iconImageAssetPath: 'assets/img/welcome_about.png',
      body: Text(
        '学号:201513040306',
      ),
      title: Text('关于我们'),
      mainImage: Image.asset(
        'assets/img/welcome_about.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IntroViews Flutter', //title of app
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), //ThemeData
      home: Builder(
        builder: (context) => IntroViewsFlutter(
              pages,
              onTapDoneButton: () {
                // 设置已经阅读过welcome值
                CommonUtil.setShared("welcomed", "welcomed");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return LoginPage();
                    },
                  ), //MaterialPageRoute
                );
              },
              pageButtonTextStyles: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ), //IntroViewsFlutter
      ), //Builder
    ); //Material App
  }
}
