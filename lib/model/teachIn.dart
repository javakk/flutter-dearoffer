class TeachIn {
   String id;

   String companyName;

   String schoolName;

   String content;

   String address;

   String startTime;

   bool onNet;

  TeachIn(
      {this.id,
      this.companyName,
      this.schoolName,
      this.content,
      this.address,
      this.startTime,this.onNet});

  factory TeachIn.fromJson(Map<String, dynamic> json) {
    return TeachIn(
        id: json["id"] ?? "",
        companyName: json["companyName"] ?? "",
        schoolName: json["schoolName"] ?? "",
        content: json["content"] ?? "",
        address: json["address"] ?? "",
        startTime: json["startTime"] ?? "",
        onNet: false
    );
  }

  static TeachIn loadingFromJianDan(Map<String, dynamic> json) {
    return TeachIn(
        id: "${json["id"]}" ?? "",
        companyName: json["title"] ?? "",
        schoolName: json["school"] ?? "",
        content: json["content"] ?? "",
        address: json["school"] ?? "",
        startTime: json["storeTime"] ?? "",
        onNet: true);
  }
}
