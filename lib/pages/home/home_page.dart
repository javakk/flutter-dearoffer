import 'package:flutter/material.dart';
import 'package:DearOffer/pages/company/company_list_page.dart';
import 'package:DearOffer/pages/interview/Interview_list_page.dart';
import 'package:DearOffer/pages/salary/salary_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:DearOffer/pages/teachIn/teach_in_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  loadData() async {}

  @override
  void initState() {
    loadData();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "首 页",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  FontAwesomeIcons.meetup,
                  color: Colors.white70,
                ),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.dollarSign, color: Colors.white70),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.envira, color: Colors.white70),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.teamspeak, color: Colors.white70),
              ),
            ],
            controller: _tabController,
          ),
        ),
        backgroundColor: Color(0xFFeeeeee),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            CompanyListPage(showAppBar: false),
            SalaryPage(showAppBar: false),
            InterviewListPage(showAppBar: false),
            TeachInListPage(showAppBar: false),
          ],
        ));
  }

}
