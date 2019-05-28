import 'package:DearOffer/common/config/config.dart';
import 'package:DearOffer/widgets/common/load.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:DearOffer/model/mock.dart';
import 'package:DearOffer/model/salary.dart';
import 'package:DearOffer/model/teachIn.dart';
import 'package:DearOffer/pages/search/search_page.dart';
import 'package:DearOffer/widgets/salary/salary_item.dart';
import 'package:DearOffer/widgets/teachIn/teach_in_card_item.dart';
import 'package:DearOffer/widgets/teachIn/teach_in_item.dart';

class TeachInListPage extends StatefulWidget {
  final String schoolName;

  final bool showAppBar;
  final List<TeachIn> teachIns;

  final String keyword;

  const TeachInListPage(
      {Key key, this.schoolName, this.teachIns, this.keyword, this.showAppBar})
      : super(key: key);

  @override
  _TeachInListState createState() {
    return _TeachInListState(schoolName, teachIns, keyword, showAppBar);
  }
}

class _TeachInListState extends State<TeachInListPage> with AutomaticKeepAliveClientMixin{
  String schoolName;
  bool showAppBar;
  List<TeachIn> teachInList = List();
  String keyword;
  int currentPage = 0;
  int pageSize = 10; //页容量
  int totalSize = 0; //总条数
  String loadMoreText = "没有更多数据";
  TextStyle loadMoreTextStyle =
      TextStyle(color: const Color(0xFF999999), fontSize: 14.0);
  TextStyle titleStyle =
      TextStyle(color: const Color(0xFF757575), fontSize: 14.0);

  //初始化滚动监听器，加载更多使用
  ScrollController _controller = ScrollController();

  _TeachInListState(this.schoolName, this.teachInList, this.keyword, this.showAppBar) {
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixel = _controller.position.pixels;
      if (maxScroll == pixel) {
        setState(() {
          loadMoreText = "数据载入中...";
          loadMoreTextStyle =
              TextStyle(color: const Color(0xFF4483f6), fontSize: 14.0);
        });
        loadMoreData();
      } else {
        setState(() {
          loadMoreText = "没有更多数据";
          loadMoreTextStyle =
              TextStyle(color: const Color(0xFF999999), fontSize: 14.0);
        });
      }
    });
  }

  // 下拉刷新
  Future _pullToRefresh() async {
    currentPage = 0;
    teachInList.clear();
    loadMoreData();
    return null;
  }

  loadMoreData() async {
    teachInList = teachInList ?? List<TeachIn>();
    List<TeachIn> tempList = List();
    this.currentPage++;
    if (schoolName == null && keyword == null) {
      // 加载最新数据
      String url =
          "http://api.tomxin.cn:8080/recruit?pageNum=${currentPage}&pageSize=10&keyword=&city=";
      Response response = await Dio().get(url);
      for (var value in response.data["list"]) {
        tempList.add(TeachIn.loadingFromJianDan(value));
      }
    }
    if (keyword != null && keyword.isNotEmpty) {
      Response response = await Dio().get(Config.SEARCH_TEACHIN_URL +
          "?pageNum=${currentPage}&pageSize=12&keyword=${keyword}&city=");

      for (var value in response.data["list"]) {
        tempList.add(TeachIn.loadingFromJianDan(value));
      }
    }
    teachInList.addAll(tempList);
  }

  @override
  void initState() {
    super.initState();
    //加载第一页数据
    loadMoreData();
  }

  @override
  Widget build(BuildContext context) {
    Widget data = LoadingItem();
    if (teachInList != null && teachInList.length > 0) {
      data = Scaffold(
        body: RefreshIndicator(
            child: ListView.builder(
              itemCount: teachInList.length,
              key: PageStorageKey("salary-list"),
              itemBuilder: (context, index) {
                if (index == teachInList.length && index != 0) {
                  return _buildProgressMoreIndicator();
                } else {
                  return TeachInItem(teachIn: teachInList[index]);
                }
              },
              controller: _controller,
            ),
            onRefresh: _pullToRefresh),
      );
    }
    if (showAppBar) {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              "宣 讲 会",
              style: TextStyle(color: Colors.white),
            ),
            actions: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push<String>(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return SearchPage(searchType: "teachin");
                      },
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: InkWell(
                    child: Icon(Icons.search),
                  ),
                ),
              )
            ],
          ),
          body: data);
    }
    return data;
  }

  Widget _buildProgressMoreIndicator() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: Text(loadMoreText, style: loadMoreTextStyle),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
