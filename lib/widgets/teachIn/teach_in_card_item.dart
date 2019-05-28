import 'package:flutter/material.dart';
import 'package:DearOffer/common/utils/common_util.dart';
import 'package:DearOffer/model/teachIn.dart';
import 'package:DearOffer/pages/teachIn/teach_in_list_page.dart';

class TeachInCardItem extends StatelessWidget {
  final List<TeachIn> teachIns;

  const TeachInCardItem({this.teachIns});

  @override
  Widget build(BuildContext context) {
    if (teachIns != null && teachIns.length > 0) {
      int count = 0;
      List<Widget> wigets = List();
      wigets.add(Padding(
        padding: EdgeInsets.only(top: 10),
        child: Text(
          teachIns[0].schoolName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 25.0),
        ),
      ));
      for (var teachIn in teachIns) {
        if (++count >= 15) break;
        wigets.add(Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            teachIn.companyName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 15.0),
          ),
        ));
      }
      return GestureDetector(
        onTap: () {
          Navigator.push<String>(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return TeachInListPage(
                    schoolName: teachIns[0].schoolName,
                    teachIns: teachIns,
                    showAppBar: true);
              },
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: wigets,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
      );
    } else {
      return Text("发生异常");
    }
  }
}
