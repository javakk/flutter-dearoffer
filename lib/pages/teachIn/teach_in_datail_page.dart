import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:DearOffer/model/teachIn.dart';
import 'package:DearOffer/widgets/teachIn/teach_in_item.dart';
import 'package:flutter_html_widget/flutter_html_widget.dart';

class TeachInDetailPage extends StatefulWidget {
  final TeachIn teachIn;

  const TeachInDetailPage({this.teachIn});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TeachInDetailPage(teachIn);
  }
}

class _TeachInDetailPage extends State<TeachInDetailPage> {
  TeachIn teachIn;

  _TeachInDetailPage(this.teachIn);

  @override
  void initState() {
    loadMoreData();
  }

  loadMoreData() async {
    if (teachIn != null && teachIn.onNet) {
      String url = "http://api.tomxin.cn:8080/recruit/${teachIn.id}";
      Response response = await Dio().get(url);
      String contentStr = response.data["content"].toString().replaceAll("&nbsp;", " ");
      teachIn.content = contentStr;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color(0xFF66CCFF),
        child: Stack(
          children: <Widget>[
//            _getBackground(),
            _getGradient(),
            _getContent(),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }

//  Container _getBackground() {
//    return Container(
//      child: Image.network(
//        "https://uploadbeta.com/api/pictures/random/?key=BingEverydayWallpaperPicture",
//        fit: BoxFit.cover,
//        height: 300.0,
//      ),
//      constraints: BoxConstraints.expand(height: 295.0),
//    );
//  }

  Container _getGradient() {
    return Container(
      margin: EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[Color(0xFF66CCFF), Color(0xFF66CCFF)],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Container _getContent() {
    final _overviewTitle = "招聘信息";
    return Container(
      child: ListView(
        padding: EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 00.0),
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TeachInItem(
                  teachIn: teachIn,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Text(
                  _overviewTitle,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: HtmlWidget(html: teachIn.content),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _getToolbar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: BackButton(color: Colors.white),
    );
  }
}
