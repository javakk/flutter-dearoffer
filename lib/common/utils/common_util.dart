import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CommonUtil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

  Color randomColor(){

    Random random = new Random();

    int r = random.nextInt(200) + 55;
    int g = random.nextInt(220) + 35;
    int b = random.nextInt(240) + 15;

    return Color.fromRGBO(r, g, b, 1);
  }

  /*
   * 存储数据
   */
  static Future setShared(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
    print('写入数据:$value');
  }

  /*
   * 删除数据
   */
  static Future removeShared(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(key);
  }


}