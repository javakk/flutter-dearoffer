import 'package:DearOffer/layout_type.dart';
import 'package:DearOffer/pages/home/home_page.dart';
import 'package:DearOffer/pages/mine/mine_page.dart';
import 'package:DearOffer/pages/search/search_page.dart';
import 'package:DearOffer/pages/teachIn/teach_in_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  LayoutType _layoutSelection = LayoutType.home;
  Color _colorTabMatching({LayoutType layoutSelection}) {
    return _layoutSelection == layoutSelection
        ? Color(0xFF66ccff)
        : Colors.grey;
  }

  BottomNavigationBarItem _buildItem(
      {String icon, LayoutType layoutSelection}) {
    String text = layoutName(layoutSelection);
    return BottomNavigationBarItem(
      icon: Image.asset(
        icon,
        width: 35.0,
        height: 35.0,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorTabMatching(layoutSelection: layoutSelection),
        ),
      ),
    );
  }

  Widget _buildButtonNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(
            icon: _layoutSelection == LayoutType.home
                ? "assets/img/tab_home_pre.png"
                : "assets/img/tab_home_nor.png",
            layoutSelection: LayoutType.home),
        _buildItem(
            icon: _layoutSelection == LayoutType.teachin
                ? "assets/img/tab_teachin_pre.png"
                : "assets/img/tab_teachin_nor.png",
            layoutSelection: LayoutType.teachin),
        _buildItem(
            icon: _layoutSelection == LayoutType.search
                ? "assets/img/tab_search_pre.png"
                : "assets/img/tab_search_nor.png",
            layoutSelection: LayoutType.search),
        _buildItem(
            icon: _layoutSelection == LayoutType.mine
                ? "assets/img/tab_mine_pre.png"
                : "assets/img/tab_mine_nor.png",
            layoutSelection: LayoutType.mine),
      ],
      onTap: _onSelectTab,
    );
  }

  void _onLayoutSelected(LayoutType selection) {
    setState(() {
      _layoutSelection = selection;
    });
  }

  void _onSelectTab(int index) {
    switch (index) {
      case 0:
        _onLayoutSelected(LayoutType.home);
        break;
      case 1:
        _onLayoutSelected(LayoutType.teachin);
        break;
      case 2:
        _onLayoutSelected(LayoutType.search);
        break;
      case 3:
        _onLayoutSelected(LayoutType.mine);
        break;
    }
  }

  Widget _buildBody() {
    LayoutType layoutSelection = _layoutSelection;
    switch (layoutSelection) {
      case LayoutType.home:
        return HomePage();
      case LayoutType.teachin:
        return TeachInPage();
      case LayoutType.search:
        return SearchPage();
      case LayoutType.mine:
        return MinePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildButtonNavBar(),
    );
  }


}