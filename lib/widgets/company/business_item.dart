import 'package:flutter/material.dart';

class BusinessItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String content;

  const BusinessItem({this.title, this.icon, this.content});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(right: 6),
            child:  Icon(
              icon,
              color: Colors.white,
              size: 18.0,
            ),
          ),
          Expanded(
              child: Text(
            "${title} : ${content}",
            style: TextStyle(color: Colors.white, fontSize: 16.0),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )),
        ],
      ),
    );
  }
}
