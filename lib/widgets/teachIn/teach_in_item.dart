import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:DearOffer/model/teachIn.dart';
import 'package:DearOffer/pages/teachIn/teach_in_datail_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TeachInItem extends StatelessWidget {
  final TeachIn teachIn;

  const TeachInItem({Key key, this.teachIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push<String>(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return TeachInDetailPage(teachIn: teachIn);
            },
          ),
        );
      },
      child: Container(
        height: 150,
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    teachIn.companyName,
                    style: TextStyle(fontSize: 20),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.school,
                        size: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(teachIn.schoolName),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.addressCard,
                        size: 12,
                      ),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Expanded(
                          child: Text(
                        teachIn.address,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.calendarTimes,
                        size: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                      ),
                      Text(teachIn.startTime)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
