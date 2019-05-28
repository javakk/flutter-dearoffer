import 'package:flutter/material.dart';
import 'package:DearOffer/model/comment.dart';
import 'package:DearOffer/model/interview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_html_widget/flutter_html_widget.dart';

class InterviewPage extends StatefulWidget {
  final Interview interview;

  final Comment comment;

  final Color color;

  const InterviewPage({Key key, this.interview, this.comment, this.color})
      : super(key: key);

  @override
  _InterviewPageState createState() {
    // TODO: implement createState
    return _InterviewPageState(key, interview, comment, color);
  }
}

class _InterviewPageState extends State<InterviewPage> {
  Interview interview;

  Comment comment;

  Color color;

  _InterviewPageState(Key key, this.interview, this.comment, this.color);

  @override
  Widget build(BuildContext context) {
    String appBar = interview == null ? "点评详情" : "经验详情";
    String title = interview == null ? "" : interview.title;
    String publisherHead =
        interview == null ? comment.publisherHead : interview.publisherHead;
    String publisherName =
        interview == null ? comment.publisherName : interview.publisherName;
    String createTime =
        interview == null ? comment.createTime : interview.createTime;
    int pageView = interview == null ? comment.pageView : interview.likeCount;
    String companyName =
        interview == null ? comment.companyName : interview.companyName;
    int score = interview == null ? comment.score : interview.score;
    String content = interview == null ? comment.content : interview.content;
    int likedCount =
        interview == null ? comment.likedCount : interview.likeCount;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBar,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(publisherHead),
                      radius: 17,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            publisherName,
                            style: TextStyle(color: color, fontSize: 15),
                          ),
                          Text(
                            createTime,
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "${pageView}浏览",
                        style: TextStyle(color: Colors.blue),
                        textAlign: TextAlign.right,
                      ),
                      flex: 4,
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.houseDamage,
                      size: 12,
                      color: Colors.blue,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                    ),
                    Text(companyName),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                    ),
                    Icon(
                      Icons.score,
                      size: 18,
                      color: Colors.blue,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 2),
                    ),
                    Text("${score}分")
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                ),
                HtmlWidget(html: content)
              ],
            ),
          )
        ],
      ),
    );
  }
}
