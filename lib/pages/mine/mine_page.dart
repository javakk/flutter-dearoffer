import 'package:DearOffer/common/utils/common_util.dart';
import 'package:DearOffer/main_page.dart';
import 'package:DearOffer/pages/mine/login_page.dart';
import 'package:flutter/material.dart';
import 'package:DearOffer/widgets/mine/contact_item.dart';
import 'package:DearOffer/widgets/mine/menu_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>  {

  String userName = "";
  String token = "";

  final double _appBarHeight = 180.0;

  Future getUserInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      userName = sp.get("userName");
      token = sp.get("token");
    });
  }

  @override
  Widget build(BuildContext context) {
    getUserInfo();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 245),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: _appBarHeight,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  const DecoratedBox(
                    decoration: const BoxDecoration(
                      gradient: const LinearGradient(
                        begin: const Alignment(0.0, -1.0),
                        end: const Alignment(0.0, -0.4),
                        colors: const <Color>[
                          const Color(0x00000000),
                          const Color(0x00000000)
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 60.0,
                                left: 30.0,
                                bottom: 15.0,
                              ),
                              child: Text(
                                userName,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ContactItem(
                          count: '12',
                          title: '感兴趣',
                        ),
                        ContactItem(
                          count: '71',
                          title: '发帖',
                        ),
                        ContactItem(
                          count: '53',
                          title: '提问',
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        child: MenuItem(
                          icon: FontAwesomeIcons.digitalOcean,
                          title: '微简历',
                        ),
                      ),
                      MenuItem(
                        icon: FontAwesomeIcons.stethoscope,
                        title: '简历诊断',
                      ),
                      GestureDetector(
                        child: MenuItem(
                          icon: FontAwesomeIcons.mailBulk,
                          title: '检查新版本',
                        ),
                        onTap: () {
                          final snackbar = SnackBar(
                            content: Text("已是最新版本"),
                            duration: Duration(seconds: 2),
                            backgroundColor: Color(0xFF66CCFF),
                          );
                          Scaffold.of(context).showSnackBar(snackbar);
                        },
                      ),
                      GestureDetector(
                        child: MenuItem(
                          icon: FontAwesomeIcons.signOutAlt,
                          title: '退出登录',
                        ),
                        onTap: () {
                          CommonUtil.removeShared("login");
                          Navigator.push<String>(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return LoginPage();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
