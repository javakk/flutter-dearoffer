import 'package:DearOffer/common/config/config.dart';
import 'package:DearOffer/model/teachIn.dart';
import 'package:DearOffer/widgets/common/load.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:DearOffer/widgets/teachIn/teach_in_card_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeachInPage extends StatefulWidget {
  @override
  _TeachInState createState() {
    return _TeachInState();
  }
}

class _TeachInState extends State<TeachInPage>
    with AutomaticKeepAliveClientMixin {
  List<List<TeachIn>> resultList = List();

  List<String> resultKeys = List();

  String userName = "";

  int totalCount = 0;

  Future getUserInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      userName = sp.get("userName");
    });
  }

  loadData() async {
    getUserInfo();
    Response response = await Dio().get(Config.TEACHIN_URL + "/new");

    Map<String, dynamic> map = response.data["data"];

    map.forEach((schoolName, list) {
      List<TeachIn> tempList = List();
      for (var value in list) {
        TeachIn teachIn = TeachIn.fromJson(value);
        tempList.add(teachIn);
        totalCount += 1;
      }

      resultList.add(tempList);
    });
  }

  @override
  void initState() {
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    Widget data = LoadingItem();
    if (resultList != null && resultList.length > 0) {
      data = Swiper(
        itemBuilder: (BuildContext context, int index) {
          return TeachInCardItem(teachIns: resultList[index]);
        },
        itemCount: resultList.length,
        itemWidth: 400.0,
        itemHeight: 500.0,
        layout: SwiperLayout.TINDER,
      );
    }
    return Scaffold(
        body: Container(
      width: 500,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[Color(0xFFC9F1F1), Color(0xFF44DAFF)],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 100),
          ),
          Text(
            "Hi ${userName}",
            style: TextStyle(fontSize: 35, color: Colors.white),
          ),
          Text(
            "邀请您参加${totalCount}场宣讲会",
            style: TextStyle(fontSize: 16),
          ),
          data
        ],
      ),
    ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
