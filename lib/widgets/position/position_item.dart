import 'package:flutter/material.dart';
import 'package:DearOffer/model/position.dart';

class PositionItem extends StatelessWidget {
  final Position position;

  const PositionItem({Key key, this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String salary = position.salary ?? "";
    String city = "${position.cityTag[0]}  | " ?? "";
    String financingTag = " ${position.financingTag}  | " ?? "";
    String companyScale = "${position.companyScale} " ?? "";

    return Padding(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(position.logo),
            radius: 22,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        position.title,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        overflow: TextOverflow.ellipsis,
                      ),
                      width: 180,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                    ),
                    Text(
                      salary,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
                Text(
                  "${city} ${financingTag}  ${companyScale}  ",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
