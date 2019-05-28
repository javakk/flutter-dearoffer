import 'package:flutter/material.dart';
import 'package:DearOffer/common/utils/common_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HotItem extends StatelessWidget {

  final String content;
  final int score;
  final int index;

  const HotItem({Key key, this.content, this.score, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 3),
      child: Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left: 5)),
           Text(
              "${index+1}.${content}",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          Icon(
            FontAwesomeIcons.fire,
            color: Color(0xFFF46060),
            size: 18,
          ),
          Text(
            "${score}",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 15, color: Color(0xFFF46060)),
          ),
        ],
      ),
    );
  }
}
