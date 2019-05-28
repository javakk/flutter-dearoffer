import 'package:flutter/material.dart';
import 'package:DearOffer/model/comment.dart';
import 'package:DearOffer/pages/interview/interviwe_page.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;

  const CommentItem({Key key, this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push<String>(
          context,
          new MaterialPageRoute(
            builder: (BuildContext context) {
              return new InterviewPage(
                  comment: comment, color: Colors.black12);
            },
          ),
        );
      },
      child: Container(
          child: Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
              child: Column(children: <Widget>[
                Row(children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(comment.publisherHead),
                    radius: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          comment.publisherName,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          comment.createTime,
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                    flex: 5,
                  ),
                  Expanded(
                    child: Container(
                      height: 20,
                      child: Center(
                          child: Text(
                        "${comment.score}分",
                        style: TextStyle(),
                      )),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    ),
                    flex: 1,
                  )
                ]),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    comment.content,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ]))),
    );
  }
}
