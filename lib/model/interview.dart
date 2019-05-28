class Interview {
  final String id;//id
  final int likeCount;//点赞
  final int pageView;//浏览
  final int score;//体验评分
  final String content;//内容
  final String title;//标题
  final String publisherName;//发布者
  final String publisherHead;//发布者头像
  final String experienceTag;//经验字典
  final String companyName;//公司
  final String createTime;

  Interview({this.id, this.likeCount, this.pageView, this.score, this.content, this.title, this.publisherName, this.publisherHead, this.experienceTag, this.companyName, this.createTime});// 发布时间


  factory Interview.fromJson(Map<String, dynamic> json) {
    return Interview(
        id: json['id'] ?? "未知",
        likeCount: json['likeCount'] ?? 1,
        pageView: json['pageView'] ?? 1,
        score: json['score'] ?? 3,
        content: json['content'] ?? "未知",
        title: json['title'] ?? "未知",
        publisherName: json['publisherName'] ?? "未知",
        publisherHead: json['publisherHead'] ?? "未知",
        experienceTag: json['experienceTag'] ?? "未知",
        companyName: json['companyName'] ?? "未知",
        createTime: json['publisherDate'] ?? "未知"
    );
  }
}

