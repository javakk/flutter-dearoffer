import 'package:DearOffer/common/config/config.dart';
import 'package:DearOffer/pages/company/company_list_page.dart';
import 'package:DearOffer/pages/interview/Interview_list_page.dart';
import 'package:DearOffer/pages/salary/salary_page.dart';
import 'package:DearOffer/pages/teachIn/teach_in_list_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:DearOffer/widgets/search/hot_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchPage extends StatefulWidget {
  final String searchType;

  const SearchPage({Key key, this.searchType}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SearchPage(searchType);
  }
}

class _SearchPage extends State<SearchPage>{
  List<Hot> hotItems = List();
  String searchType;

  _SearchPage(this.searchType);

  String searchContent = "";
  TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //加载数据
    loadData();
  }

  loadData() async {
    Response response = await Dio().get(Config.SEARCH_NOT_URL);
    List responseData = response.data["data"];

    if (responseData != null) {
      for (var tempMap in responseData) {
        Hot hot = Hot(tempMap["score"].toInt(), tempMap["value"]);
        setState(() {
          hotItems.add(hot);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 40, left: 10, bottom: 10),
          child: TextField(
              textInputAction: TextInputAction.search,
              style: TextStyle(
                  fontFamily: "WorkSansSemiBold",
                  fontSize: 16.0,
                  color: Colors.black),
              decoration: InputDecoration(
                hintText: "输入想搜索的信息",
                hintStyle:
                    TextStyle(fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                icon: Icon(
                  FontAwesomeIcons.search,
                  color: Color(0xFF66ccff),
                ),
              ),
              controller: contentController,
              onSubmitted: _preSearch),
        ),
        Row(
          children: <Widget>[
            ClickBtn(
              icon: FontAwesomeIcons.meetup,
              searchType: "company",
              title: "公司",
              keyword: contentController.text,
            ),
            ClickBtn(
              icon: FontAwesomeIcons.dollarSign,
              searchType: "salary",
              title: "薪水",
              keyword: contentController.text,
            ),
            ClickBtn(
              icon: FontAwesomeIcons.envira,
              searchType: "interview",
              title: "面经",
              keyword: contentController.text,
            ),
            ClickBtn(
              icon: FontAwesomeIcons.teamspeak,
              searchType: "teachin",
              title: "宣讲会",
              keyword: contentController.text,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: hotItems.length,
            key: PageStorageKey("hot-list"),
            itemBuilder: (content, index) {
              return HotItem(
                  key: PageStorageKey(hotItems[index].content),
                  content: hotItems[index].content,
                  score: hotItems[index].score,
                  index: index);
            },
            scrollDirection: Axis.vertical,
          ),
        ),
      ],
    ));
  }

  void _preSearch(String keyword) {
    final snackbar = SnackBar(
      content: Text("请选择搜索类型"),
      duration: Duration(seconds: 2),
      backgroundColor: Color(0xFF66CCFF),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }

}

class ClickBtn extends StatelessWidget {
  final IconData icon;
  final String title;
  final String searchType;
  final String keyword;

  const ClickBtn({this.icon, this.title, this.searchType, this.keyword});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              color: Color(0xFF66CCFF),
              size: 40,
            ),
            Padding(
              padding: EdgeInsets.only(top: 3),
            ),
            Text(title)
          ],
        ),
        onTap: () {
          submitSearch(searchType, keyword, context);
        },
      ),
      flex: 1,
    );
  }

  void submitSearch(String searchType, String keyword, BuildContext context) {
    if (keyword == null || keyword.isEmpty) {
      final snackbar = SnackBar(
        content: Text("请输入关键词"),
        duration: Duration(seconds: 2),
        backgroundColor: Color(0xFF66CCFF),
      );
      Scaffold.of(context).showSnackBar(snackbar);
      return;
    }

    switch (searchType) {
      case 'company':
        Navigator.push<String>(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return CompanyListPage(showAppBar: true, keyword: keyword);
            },
          ),
        );
        break;
      case 'salary':
        Navigator.push<String>(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return SalaryPage(showAppBar: true, keyword: keyword);
            },
          ),
        );
        break;
      case 'interview':
        Navigator.push<String>(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return InterviewListPage(showAppBar: true,keyword: keyword);
            },
          ),
        );
        break;
      case 'teachin':
        Navigator.push<String>(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return TeachInListPage(showAppBar: true, keyword: keyword);
            },
          ),
        );
        break;
    }
  }
}

class Hot {
  int score;
  String content;

  Hot(this.score, this.content);
}
