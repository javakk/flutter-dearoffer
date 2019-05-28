class Position {
  final String id; //
  final String publisherId; //发布者
  final String positionTag; //职位类型字典
  final List<String> cityTag; //所在城市字典
  final String experienceTag; //工作时间字典
  final List<String> degreeTag; //学历字典
  final String salaryLow; //薪资起点
  final String salaryHigh; //薪资终点
  final List<String> skillTag; //技能字典
  final String description; //具体描述
  final String attachment; //附件说明
  final int total; //具体人数
  final String applyStart; //申请开始
  final String companyId; //公司
  final String title; //职位名称
  final String applyEnd; //申请结束
  final String interviewStart; //面试开始
  final String interviewEnd; // 面试结束

  // TODO：@JavaKK联合信息
  final String logo; // 公司Logo
  final String companyScale; // 公司Logo
  final String financingTag; // 公司Logo
  final String salary; //薪资

  Position(
      {this.id,
      this.publisherId,
      this.positionTag,
      this.cityTag,
      this.experienceTag,
      this.degreeTag,
      this.salaryLow,
      this.salaryHigh,
      this.skillTag,
      this.description,
      this.attachment,
      this.total,
      this.applyStart,
      this.companyId,
      this.title,
      this.applyEnd,
      this.interviewStart,
      this.interviewEnd,
      this.logo,
      this.companyScale,
      this.financingTag,
      this.salary});

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(
      id: json['id'],
      publisherId: json['publisherId'],
      positionTag: json['positionTag'],
      cityTag: json['cityTag'],
      experienceTag: json['experienceTag'],
      degreeTag: json['degreeTag'],
      salaryLow: json['salaryLow'],
      salaryHigh: json['salaryHigh'],
      skillTag: json['skillTag'],
      description: json['description'],
      attachment: json['attachment'],
      total: json['total'],
      applyStart: json['applyStart'],
      companyId: json['companyId'],
      title: json['title'],
      applyEnd: json['applyEnd'],
      interviewStart: json['interviewStart'],
      interviewEnd: json['interviewEnd'],
      logo: json['logo'],
      companyScale: json['companyScale'],
      financingTag: json['financingTag'],
      salary: json['salary']
    );
  }
}
