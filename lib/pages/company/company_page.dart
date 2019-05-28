import 'package:DearOffer/common/config/config.dart';
import 'package:DearOffer/widgets/company/business_item.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:DearOffer/model/comment.dart';
import 'package:DearOffer/model/company.dart';
import 'package:DearOffer/model/position.dart';
import 'package:DearOffer/widgets/company/welfare_item.dart';
import 'package:DearOffer/widgets/Comment/comment_item.dart';
import 'package:DearOffer/widgets/position/position_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:DearOffer/model/mock.dart';

class CompanyPage extends StatefulWidget {
  final Company company;

  CompanyPage({Key key, @required this.company})
      : super(key: key);

  @override
  _CompanyPage createState() => _CompanyPage(company);
}

class _CompanyPage extends State<CompanyPage>
    with SingleTickerProviderStateMixin {
  Company company;
  ScrollController _scrollController;
  bool _isShow = false;

  _CompanyPage(this.company){
    _fetchCompany();
  }

  /// 拉公司信息
  Future<Company> _fetchCompany() async {
    Response response = await Dio()
        .get(Config.COMPANY_DETAIL_URL + "${company.id}");

    company = Company.fromJson(response.data["data"]["company"]);
  }

  _scrollListener() {
    setState(() {
      if (_scrollController.offset < 56 && _isShow) {
        _isShow = false;
      } else if (_scrollController.offset >= 56 && _isShow == false) {
        _isShow = true;
      }
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 68, 76, 96),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.dstATop),
              fit: BoxFit.cover,
              image: NetworkImage(widget.company.logo),
              alignment: Alignment.center),
        ),
        child: _CompanyView(context),
      ),
    ));
  }

  // 公司详情页面
  Widget _CompanyView(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
                elevation: 0.0,
                pinned: true,
                backgroundColor:
                    Color.fromARGB(_isShow == true ? 255 : 0, 68, 76, 96),
                centerTitle: false,
                title: Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Text(
                    company.shortName,
                    style: new TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                )),
            SliverList(
                delegate: SliverChildListDelegate(<Widget>[
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20.0,
                            left: 25.0,
                            bottom: 10.0,
                          ),
                          child: Text(
                            '${company.name}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 25.0,
                              ),
                              child: Text(
                                '${company.financingTag}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 5.0,
                              ),
                              child: Text(
                                '${company.companyScaleTag}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 5.0,
                              ),
                              child: Text(
                                '${company.industryTag}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.0),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                        padding: const EdgeInsets.only(
                          top: 25.0,
                          right: 0.0,
                        ),
                        child: Hero(
                          tag: company.id,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              company.logo,
                              width: 70,
                              height: 70,
                            ),
                          ),
                        )),
                  ),
                ],
              ),
              _companyBody(context)
            ])),
          ],
        ),
      ],
    );
  }

  // 主体
  Widget _companyBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 30.0, left: 25.0, right: 20.0),
            child: _createWorkHours()),
        _createWelfareItem(context),
        Padding(
          padding: EdgeInsets.only(left: 25.0, bottom: 20.0),
          child: Text(
            "公司介绍",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0, bottom: 10.0, right: 25.0),
          child: Text(
            company.introduction,
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
        _createTitleBar("工商信息", "business", false),
        Padding(
            padding: EdgeInsets.only(left: 25.0, right: 20.0),
            child: _createBusiness()),
//        _createTitleBar("点评信息", "comment", true),
//        _createComments(),
//        _createTitleBar("招聘信息", "position", true),
//        _createPositions()
      ],
    );
  }

// 工商信息
  Widget _createBusiness() {
    return Column(
      children: <Widget>[
        BusinessItem(
            title: "公司全称",
            icon: FontAwesomeIcons.snowflake,
            content: company.name),
        BusinessItem(
            title: "公司简称",
            icon: FontAwesomeIcons.snowboarding,
            content: company.shortName),
        BusinessItem(
            title: "注册地址",
            icon: FontAwesomeIcons.home,
            content: company.address),
        BusinessItem(
            title: "公司性质",
            icon: FontAwesomeIcons.cube,
            content: company.companyType),
        BusinessItem(
            title: "社会代码",
            icon: FontAwesomeIcons.code,
            content: company.registerCode),
        BusinessItem(
            title: "法人代表",
            icon: FontAwesomeIcons.user,
            content: company.registerPerson),
        BusinessItem(
            title: "注册资本",
            icon: FontAwesomeIcons.moneyCheck,
            content: company.registerMoney),
        BusinessItem(
            title: "成立时间",
            icon: FontAwesomeIcons.creditCard,
            content: company.registerTime),
        BusinessItem(
            title: "经营范围",
            icon: FontAwesomeIcons.solidArrowAltCircleLeft,
            content: company.sellScale),
      ],
    );
  }

  // 基本信息
  Widget _createWorkHours() {
    return Wrap(
      spacing: 40.0,
      runSpacing: 16.0,
      direction: Axis.horizontal,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.person,
              color: Colors.white,
              size: 18.0,
            ),
            Padding(
              padding: EdgeInsets.only(right: 6.0),
            ),
            Text(
              company.registerPerson,
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.account_balance_wallet,
              color: Colors.white,
              size: 18.0,
            ),
            Padding(
              padding: EdgeInsets.only(right: 6.0),
            ),
            Text(
              company.registerMoney,
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.map,
              color: Colors.white,
              size: 18.0,
            ),
            Padding(
              padding: EdgeInsets.only(right: 6.0),
            ),
            Expanded(
                child: Text(
              company.address,
              style: TextStyle(color: Colors.white, fontSize: 16.0),
              maxLines: 3,
            ))
          ],
        ),
      ],
    );
  }

  // 公司福利
  Widget _createWelfareItem(BuildContext context) {
    List<String> welfareStr = company.welfareTags;
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
        bottom: 10.0,
      ),
      child: Container(
        margin: EdgeInsets.only(left: 20.0, top: 0.0, right: 0.0, bottom: 20.0),
        height: 120.0,
        child: ListView.builder(
            itemCount: welfareStr.length,
            key: PageStorageKey("welfare-list"),
            itemBuilder: (context, index) {
              return WelfareItem(title: welfareStr[index]);
            },
            scrollDirection: Axis.horizontal),
      ),
    );
  }

  // 员工点评
  Widget _createComments() {
    List<Widget> commentItems = List();
    if (commentsMock != null && commentsMock.length > 0) {
      for (Comment comment in commentsMock) {
        Widget widget = CommentItem(key: Key(comment.id), comment: comment);
        commentItems.add(widget);
      }
    }
    return Column(children: commentItems);
  }

  Widget _createTitleBar(String title, String page, bool needMore) {
    List<Widget> widgets = List();

    Widget baseWidget = Padding(
      padding: EdgeInsets.only(top: 30, left: 25.0, bottom: 20.0),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
    );

    Widget moreWidget = Padding(
      padding: EdgeInsets.only(top: 30, left: 0.0, bottom: 30.0),
      child: Text(
        "more+",
        style: TextStyle(color: Colors.greenAccent, fontSize: 10.0),
      ),
    );

    widgets.add(baseWidget);
    if (needMore) {
      widgets.add(moreWidget);
    }

    return Row(children: widgets);
  }

  Widget _createPositions() {
    List<Widget> positionItems = List();
    if (positionsMock != null && positionsMock.length > 0) {
      for (Position position in positionsMock) {
        Widget widget = PositionItem(key: Key(position.id), position: position);
        positionItems.add(widget);
      }
    }
    return Column(children: positionItems);
  }
}
