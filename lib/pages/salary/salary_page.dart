import 'package:DearOffer/common/config/config.dart';
import 'package:DearOffer/pages/salary/add_salary_page.dart';
import 'package:DearOffer/pages/teachIn/teach_in_list_page.dart';
import 'package:DearOffer/widgets/common/load.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:DearOffer/model/mock.dart';
import 'package:DearOffer/model/salary.dart';
import 'package:DearOffer/pages/search/search_page.dart';
import 'package:DearOffer/widgets/salary/salary_item.dart';

class SalaryPage extends StatefulWidget {
  final String keyword;

  final bool showAppBar;

  const SalaryPage({Key key, this.keyword, this.showAppBar}) : super(key: key);

  @override
  _SalaryState createState() {
    return _SalaryState(keyword, showAppBar);
  }
}

class _SalaryState extends State<SalaryPage>
    with AutomaticKeepAliveClientMixin {
  List<Salary> salaryList = List();
  bool showAppBar;
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

  _SalaryState(this.keyword, this.showAppBar) {
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
    salaryList.clear();
    loadMoreData();
    return null;
  }

  loadMoreData() async {
    Map searchMap = Map();
    Response response;
    this.currentPage++;

    if (keyword != null && keyword.isNotEmpty) {
      searchMap["companyName"] = keyword;
      response = await Dio()
          .post(Config.SEARCH_SALARY_URL + "${currentPage}/5", data: searchMap);
    } else {
      response = await Dio().post(
          Config.SALARY_URL + "/search/${currentPage}/5",
          data: searchMap);
    }

    List responseData = response.data["data"]["rows"];
    List<Salary> list = List();
    if (responseData != null) {
      for (var value in responseData) {
        Salary temp = Salary.fromJson(value);
        list.add(temp);
      }
    }
    setState(() {
      salaryList.addAll(list);
    });
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
    if (salaryList.length > 0) {
      data = RefreshIndicator(
          child: ListView.builder(
            itemCount: salaryList.length,
            key: PageStorageKey("salary-list"),
            itemBuilder: (context, index) {
              if (index == salaryList.length - 1) {
                return _buildProgressMoreIndicator();
              } else {
                return SalaryItem(salary: salaryList[index]);
              }
            },
            controller: _controller,
          ),
          onRefresh: _pullToRefresh);
    }
    if (showAppBar) {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              "薪 水",
              style: TextStyle(color: Colors.white),
            ),
            actions: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push<String>(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return SearchPage(searchType: "salary");
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

    return Scaffold(
      body: data,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push<String>(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return AddSalaryPage();
              },
            ),
          );
        },
        child: Image.asset("assets/img/icon_add.png", height: 35, width: 35,),
      ),
    );
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
