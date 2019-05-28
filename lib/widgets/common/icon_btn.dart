import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconBtn extends StatelessWidget {

  final IconData icon;
  final String content;

  const IconBtn({Key key, this.icon, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 35,
          color: Color(0xFF66ccff),
        ),
        Padding(
          padding: EdgeInsets.only(top:5),
        ),
        Text(
          content,
          style: TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }

}