class Push{
  final String id;
  final String activityLink;
  final String imageUrl;
  final String title;

  Push({this.id, this.activityLink, this.imageUrl, this.title});

  factory Push.fromJson(Map<String, dynamic> json) {
    return Push(
      id: json["id"] ?? "",
        activityLink: json['activityLink'] ?? "",
      imageUrl: json['imageUrl'] ?? "",
      title: json['title'] ?? ""
    );
  }
}