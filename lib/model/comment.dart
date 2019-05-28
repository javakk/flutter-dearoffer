class Comment {
  final String id; //
  final int score; //得分（满分10）
  final List<String> commentTag; //标签
  final int likedCount; //点赞
  final String companyId; //公司
  final String content; //内容

  final String publisherName;
  final String publisherHead; //user_id
  final String createTime;
  final String companyName;


  final int pageView;

  Comment(
      {this.id,
      this.score,
      this.commentTag,
      this.likedCount,
      this.companyId,
      this.content,
      this.publisherName,
      this.publisherHead,
      this.createTime,
      this.companyName,
      this.pageView});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
        id: json['id'],
        score: json['score'],
        commentTag: json['commentTag'],
        likedCount: json['likedCount'],
        companyId: json['companyId'],
        content: json['content'],
        publisherName: json['publisherName'],
        publisherHead: json['publisherHead'],
        createTime: json['createTime'],
        companyName: json['companyName'],
    pageView: json['pageView']);
  }
}
