class Salary {
  final String id; //
  final String companyId; //所属公司
  final double monthTotal; //月薪单位K
  final double periods; //期数
  final String detail; //额外说明
  final int credibility; //可信度
  final String degreeTag; //学历字典
  final String bonus; //其他福利
  final String city; //所属城市
  final String positionTitle; //职位名称
  final String skillTag; //技能标签
  final int pageView; //浏览量
  final String createTime; //

  // TODO:添加后台
  final String companyName;
  final String salary;

  Salary(
      {this.id,
      this.companyId,
      this.monthTotal,
      this.periods,
      this.detail,
      this.credibility,
      this.degreeTag,
      this.bonus,
      this.city,
      this.positionTitle,
      this.skillTag,
      this.pageView,
      this.createTime,
      this.companyName,
      this.salary});

  // TODO: @JavaKK -
  factory Salary.fromJson(Map<String, dynamic> json) {
    return Salary(
      id: json["id"] ?? "",
      companyId: json["companyId"] ?? "",
      monthTotal: json["monthTotal"] ?? 0,
      periods: json["periods"] ?? 0,
      detail: json["detail"] ?? "",
      credibility: json["credibility"] ?? 0,
      degreeTag: json["degreeTag"] ?? "本科",
      bonus: json["bonus"] ?? "",
      city: json["city"] ?? "",
      positionTitle: json["positionTitle"] ?? "",
      skillTag: json["skillTag"] ?? "",
      pageView: json["pageView"] ?? 0,
      createTime: json["createTime"] ?? "",
      companyName: json["companyName"] ?? "",
      salary: json["salary"] ?? ""
    );
  }
}
