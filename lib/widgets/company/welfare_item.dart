import 'package:flutter/material.dart';

class WelfareItem extends StatelessWidget {
  WelfareItem({this.title});

  final String title;

  Map<String, IconData> iconHash = {
    "美女如云": Icons.face,
    "年终分红": Icons.attach_money,
    "智能硬件": Icons.brightness_5,
    "股票期权": Icons.compare_arrows,
    "领导nice": Icons.verified_user,
    "免费零食": Icons.fastfood,
    "地铁周边": Icons.subway,
    "带薪年假": Icons.date_range,
    "团建丰富": Icons.vignette,
    "年度旅游": Icons.card_travel
  };
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 120.0,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.symmetric(horizontal: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        border: Border.all(
          color: Colors.white,
          width: 0.25,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            iconHash[title] == null ? Icons.history: iconHash[title],
            color: Colors.white,
            size: 32.0,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          Text(
            title,
            style: new TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ],
      ),
    );
  }


  IconData getIcon(String title) {

  }
}


