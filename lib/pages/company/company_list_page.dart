import 'package:DearOffer/common/config/config.dart';
import 'package:DearOffer/model/push.dart';
import 'package:DearOffer/pages/home/web_page.dart';
import 'package:DearOffer/pages/search/search_page.dart';
import 'package:DearOffer/widgets/common/load.dart';
import 'package:flutter/material.dart';
import 'package:DearOffer/model/company.dart';
import 'package:DearOffer/widgets/company/company_item.dart';
import 'package:dio/dio.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class CompanyListPage extends StatefulWidget {
  final bool showAppBar;
  final String keyword;

  const CompanyListPage({Key key, this.showAppBar, this.keyword})
      : super(key: key);

  @override
  _CompanyListState createState() {
    return _CompanyListState(showAppBar, keyword);
  }
}

class _CompanyListState extends State<CompanyListPage> with AutomaticKeepAliveClientMixin{
  List<Company> companyList = List();
  List<Push> pushList = List();
  ScrollController _scrollController = ScrollController();
  String keyword;

  int currentPage = 0;
  int totalSize = 0; //总条数
  String loadMoreText = "没有更多数据";
  TextStyle loadMoreTextStyle =
      TextStyle(color: const Color(0xFF999999), fontSize: 14.0);
  TextStyle titleStyle =
      TextStyle(color: const Color(0xFF757575), fontSize: 14.0);

  final bool showAppBar;

  _CompanyListState(this.showAppBar, this.keyword) {
    _scrollController.addListener(() {
      var maxScroll = _scrollController.position.maxScrollExtent;
      var pixel = _scrollController.position.pixels;
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
    companyList.clear();
    loadMoreData();
    return null;
  }

  loadMoreData() async {
    _buildProgressMoreIndicator();
    this.currentPage++;
    Response response;
    if (keyword == null || keyword.isEmpty) {
      response = await Dio()
          .post(Config.POST_URL + "/search/${currentPage}/10", data: {});
    } else {
      response = await Dio()
          .get(Config.SEARCH_COMPANY_URL + "${keyword}/${currentPage}/10");
    }
    List responseData = response.data["data"]["rows"];
    print(responseData);
    List<Company> list = List();
    if (responseData != null) {
      for (var value in responseData) {
        Company temp = Company.fromJson(value);
        list.add(temp);
      }
    }
    setState(() {
      companyList.addAll(list);
    });
  }

  @override
  void initState() {
    //加载第一页数据
    loadMoreData();
    loadPushData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Widget data = LoadingItem();
    if (companyList != null && companyList.length > 0 && showAppBar) {
      data = Container(
        child: RefreshIndicator(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: companyList.length,
            key: PageStorageKey("company-list"),
            itemBuilder: (context, index) {
              if (index == companyList.length - 1) {
                return _buildProgressMoreIndicator();
              } else {
                return CompanyItem(company: companyList[index]);
              }
            },
            controller: _scrollController,
          ),
          onRefresh: _pullToRefresh,
        ),
      );
    }

    if (showAppBar) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "公 司",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: data,
      );
    }

    if (companyList == null || companyList.length == 0) {
      return data;
    }

    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Theme.of(context).accentColor,
          expandedHeight: 200.0,
          flexibleSpace: pushView(context),
        ),
        SliverFixedExtentList(
          itemExtent: 80.0,
          delegate: SliverChildListDelegate(
            companyList.map((company) {
              return CompanyItem(company: company);
            }).toList(),
          ),
        ),
      ],
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

  Widget pushView(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 200.0,
        child: Swiper(
            itemBuilder: _swiperBuilder,
            itemCount: pushList.length,
            pagination: SwiperPagination(
                builder: DotSwiperPaginationBuilder(
              color: Colors.black54,
              activeColor: Colors.white,
            )),
            scrollDirection: Axis.horizontal,
            autoplay: true,
            onTap: (index) {
              print(pushList[index].activityLink);
              Navigator.push<String>(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return WebviewScaffold(
                      url: pushList[index].activityLink,
                      appBar: AppBar(
                        title: Text(
                          pushList[index].title,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              );
            }));
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.network(
      pushList[index].imageUrl,
      fit: BoxFit.fill,
    ));
  }

  void loadPushData() async {
    Response response = await Dio().get(Config.PUSH_URL);

    List tempList = response.data["data"];

    print(response);

    List<Push> list = List();

    if (tempList != null) {
      for (var value in tempList) {
        Push temp = Push.fromJson(value);
        list.add(temp);
      }
    }

    setState(() {
      pushList.addAll(list);
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}
