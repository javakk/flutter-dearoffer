import 'package:DearOffer/common/config/config.dart';
import 'package:DearOffer/model/company.dart';
import 'package:DearOffer/model/interview.dart';
import 'package:DearOffer/model/salary.dart';
import 'package:DearOffer/model/teachIn.dart';
import 'package:DearOffer/widgets/company/company_item.dart';
import 'package:DearOffer/widgets/interview/interview_item.dart';
import 'package:DearOffer/widgets/teachIn/teach_in_item.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AggressiveSearchPage extends StatefulWidget {
  final String keyword;

  const AggressiveSearchPage({Key key, this.keyword}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AggressiveSearchState(keyword);
  }
}

class _AggressiveSearchState extends State<AggressiveSearchPage> {
  List<Company> companyList = List();
  List<Salary> salaryList = List();
  List<Interview> interviewList = List();
  List<TeachIn> teachInList = List();

  String keyword;

  _AggressiveSearchState(this.keyword);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    Response esResponse = await Dio().get(Config.SEARCH_AGGRESSIVE_URL + keyword);


    List companyListTemp = esResponse.data["data"]["company"];
    List interviewListTemp = esResponse.data["data"]["interview"];


    Response teachInResponse = await Dio().get(Config.SEARCH_TEACHIN_URL +
        "?pageNum=0&keyword=${keyword}&city=");

    List teachInListTemp = teachInResponse.data["list"];

    for (var value in companyListTemp) {
      Company company = Company.fromJson(value);
      companyList.add(company);
    }

    for (var value in interviewListTemp) {
      Interview interview = Interview.fromJson(value);
      interviewList.add(interview);
    }

    for (var value in teachInListTemp) {
      TeachIn teachIn = TeachIn.loadingFromJianDan(value);
      teachInList.add(teachIn);
    }

    for (var value in interviewListTemp) {
      Interview interview = Interview.fromJson(value);
      interviewList.add(interview);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "\"${keyword}\"搜索结果",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: <Widget>[
          _buildCompany(),
          _buildTeachIn(),
          _buildInterview(),
        ],
      ),
    );
  }

  Widget _buildCompany() {
    List<Widget> widgets = List();

    if (companyList.length > 0) {
      Widget title = Padding(
        padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
        child: Text(
          "公司信息",
          style: TextStyle(color: const Color(0xFF5394FF), fontSize: 18),
        ),
      );

      widgets.add(title);
      for (Company company in companyList) {
        widgets.add(CompanyItem(company: company));
      }
    }
    return Column(
      children: widgets,
    );
  }

  Widget _buildInterview() {
    List<Widget> widgets = List();
    if (interviewList.length > 0) {
      Widget title = Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Text(
          "面试经验",
          style: TextStyle(color: const Color(0xFF5394FF), fontSize: 18),
        ),
      );
      widgets.add(title);
      for (Interview interview in interviewList) {
        widgets.add(InterviewItem(interview: interview));
      }
    }
    return Column(
      children: widgets,
    );
  }

  Widget _buildTeachIn() {
    List<Widget> widgets = List();
    if (teachInList.length > 0) {
      Widget title = Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Text(
          "宣讲会",
          style: TextStyle(color: const Color(0xFF5394FF), fontSize: 18),
        ),
      );
      widgets.add(title);
      for (TeachIn teachIn in teachInList) {
        widgets.add(TeachInItem(teachIn: teachIn));
      }
    }
    return Column(
      children: widgets,
    );
  }
}
