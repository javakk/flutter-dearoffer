import 'package:DearOffer/common/config/config.dart';
import 'package:DearOffer/common/utils/common_util.dart';
import 'package:DearOffer/pages/company/company_list_page.dart';
import 'package:DearOffer/pages/interview/Interview_list_page.dart';
import 'package:DearOffer/pages/salary/salary_page.dart';
import 'package:DearOffer/pages/search/aggressive_search_page.dart';
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

class _SearchPage extends State<SearchPage> {
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

  Widget buildChildren(List<Hot> children) {
    List<Widget> names = []; //先建一个数组用于存放循环生成的widget
    Widget content; //单独一个widg

    for (Hot item in children) {
      names.add(InkWell(
        child: Chip(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: CommonUtil.getChipBgColor(item.content),
            label: Text(item.content)),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//            return CompanyListPage(
//              showAppBar: true,
//              keyword: item.content,
//            );
            return AggressiveSearchPage(
              keyword: item.content,
            );
          }));
        },
      ));
    }
    content = Padding(
        padding: EdgeInsets.only(left: 20),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.start,
          children: names,
        ));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            "热门搜索",
            style: TextStyle(color: const Color(0xFF5394FF), fontSize: 18),
          ),
        ),
        content,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    TextField searchField = TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
            hintText: "搜索更多干货"),
        controller: contentController,
        textInputAction: TextInputAction.search,
        onEditingComplete: (){
          _preSearch(contentController.text);
        },
    );

    return Scaffold(
        appBar: AppBar(title: searchField, actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                _preSearch(contentController.text);
              })
        ]),
        body: Column(
          children: <Widget>[
            Padding(
              child: Row(
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
              padding: EdgeInsets.only(top: 5),
            ),
            buildChildren(hotItems),
          ],
        ));
  }

  void _preSearch(String keyword) {
//    final snackbar = SnackBar(
//      content: Text("选择搜索类型结果更准确"),
//      duration: Duration(seconds: 2),
//      backgroundColor: Color(0xFF66CCFF),
//    );
//    Scaffold.of(context).showSnackBar(snackbar);
    if (keyword.isNotEmpty) {
      Navigator.push<String>(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return AggressiveSearchPage(keyword: keyword);
          },
        ),
      );
    }
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
              return InterviewListPage(showAppBar: true, keyword: keyword);
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
