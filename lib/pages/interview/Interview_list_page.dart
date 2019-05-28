import 'package:DearOffer/common/config/config.dart';
import 'package:DearOffer/widgets/common/load.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:DearOffer/model/interview.dart';
import 'package:DearOffer/pages/search/search_page.dart';
import 'package:DearOffer/widgets/interview/interview_item.dart';

class InterviewListPage extends StatefulWidget {
  final String keyword;
  final bool showAppBar;
  const InterviewListPage({Key key, this.keyword, this.showAppBar}) : super(key: key);

  @override
  _InterviewListState createState() {
    return _InterviewListState(keyword,showAppBar);
  }
}

class _InterviewListState extends State<InterviewListPage> with AutomaticKeepAliveClientMixin{
  List<Interview> interviewList = List();
  bool showAppBar;
  String keyword;
  int currentPage = 0;
  int pageSize = 10; //页容量
  int totalSize = 0; //总条数
  String loadMoreText = "没有更多数据";
  TextStyle loadMoreTextStyle =
      new TextStyle(color: const Color(0xFF999999), fontSize: 14.0);
  TextStyle titleStyle =
      new TextStyle(color: const Color(0xFF757575), fontSize: 14.0);

  //初始化滚动监听器，加载更多使用
  ScrollController _controller = new ScrollController();

  _InterviewListState(this.keyword, this.showAppBar) {
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixel = _controller.position.pixels;
      if (maxScroll == pixel) {
        setState(() {
          loadMoreText = "数据载入中...";
          loadMoreTextStyle =
              new TextStyle(color: const Color(0xFF4483f6), fontSize: 14.0);
        });
        loadMoreData();
      } else {
        setState(() {
          loadMoreText = "没有更多数据";
          loadMoreTextStyle =
              new TextStyle(color: const Color(0xFF999999), fontSize: 14.0);
        });
      }
    });
  }

  // 下拉刷新
  Future _pullToRefresh() async {
    currentPage = 0;
    interviewList.clear();
    loadMoreData();
    return null;
  }

  loadMoreData() async {
    this.currentPage++;
    Response response;
    if (keyword == null || keyword.isEmpty) {
      response = await Dio()
          .post(Config.INTERVIEW_URL + "/search/${currentPage}/10", data: {});
    } else {
      response = await Dio()
          .get(Config.SEARCH_INTERVIEW_URL + "${keyword}/${currentPage}/10");
    }


    List responseData = response.data["data"]["rows"];
    List<Interview> list = List();
    if (responseData != null) {
      for (var value in responseData) {
        Interview temp = Interview.fromJson(value);
        list.add(temp);
      }
    }
    setState(() {
      interviewList.addAll(list);
    });
  }

  @override
  void initState() {
    super.initState();
    //加载第一页数据
    loadMoreData();
  }

  Widget _buildProgressMoreIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(15.0),
      child: new Center(
        child: new Text(loadMoreText, style: loadMoreTextStyle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget data = LoadingItem();
    if (interviewList.length > 0) {
      data = RefreshIndicator(
        child: ListView.builder(
          itemCount: interviewList.length,
          key: PageStorageKey("interview-list"),
          itemBuilder: (context, index) {
            if (index == interviewList.length - 1) {
              return _buildProgressMoreIndicator();
            } else {
              return InterviewItem(interview: interviewList[index]);
            }
          },
          controller: _controller,
        ),
        onRefresh: _pullToRefresh,
      );
    }
    if (showAppBar) {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              "面 经",
              style: TextStyle(color: Colors.white),
            ),
            actions: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push<String>(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return SearchPage(searchType: "interview");
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
