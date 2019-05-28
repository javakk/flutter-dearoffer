import 'package:flutter/material.dart';
import 'package:DearOffer/model/interview.dart';
import 'package:DearOffer/pages/interview/interviwe_page.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class InterviewItem extends StatelessWidget {
  final Interview interview;

  const InterviewItem({Key key, this.interview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5),
        child: GestureDetector(
          onTap: () {
            Navigator.push<String>(
              context,
              new MaterialPageRoute(
                builder: (BuildContext context) {
                  return new InterviewPage(
                      interview: interview, color: Colors.black);
                },
              ),
            );
          },
          child: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage:
                            NetworkImage(interview.publisherHead),
                            radius: 13,
                          ),
                          Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  interview.publisherName,
                                  style: TextStyle(color: Colors.black),
                                ),
                              )),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              interview.createTime,
                              style:
                              TextStyle(color: Colors.black, fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        interview.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        interview.content,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.remove_red_eye,
                          size: 15,
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Text(
                          interview.likeCount.toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                        Padding(padding: EdgeInsets.only(left: 20)),
                        Icon(
                          Icons.score,
                          size: 15,
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Text(
                          "${interview.score}分",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ));
  }



}


