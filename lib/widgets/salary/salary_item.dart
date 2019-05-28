import 'package:flutter/material.dart';
import 'package:DearOffer/model/salary.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SalaryItem extends StatelessWidget {
  final Salary salary;

  const SalaryItem({Key key, this.salary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: EdgeInsets.all(0),
        child: Container(
            child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 330.0, //设置高度
                child: Card(
                  elevation: 15.0, //设置阴影
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(14.0))), //设置圆角
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(salary.positionTitle,
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        subtitle: Text(salary.companyName),
                        leading: Icon(
                          FontAwesomeIcons.delicious,
                          color: Colors.blue[500],
                        ),
                      ),
                      Divider(),
                      ListTile(
                        title: Text("${salary.city} | ${salary.degreeTag}",
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        leading: Icon(
                          FontAwesomeIcons.info,
                          color: Colors.blue[500],
                        ),
                      ),
                      ListTile(
                        title: Text(salary.bonus),
                        leading: Icon(
                          FontAwesomeIcons.wpforms,
                          color: Colors.blue[500],
                        ),
                      ),
                      ListTile(
                        title: Text(salary.detail),
                        leading: Icon(
                          FontAwesomeIcons.btc,
                          color: Colors.blue[500],
                        ),
                      ),
                      ListTile(
                        title: Text("可信度： ${salary.credibility.toString()}"),
                        leading: Icon(
                          FontAwesomeIcons.chair,
                          color: Colors.blue[500],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
