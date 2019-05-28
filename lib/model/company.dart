class Company {
  final String id;
  final String shortName;
  final String logo;

  final String financingTag;
  final String area;
  final String industryTag;

  final List<String> welfareTags;

  final String name;
  final String introduction;
  final String companyScaleTag;
  final String companyType;
  final String registerCode;
  final String registerMoney;
  final String registerPerson;
  final String registerTime;
  final String sellScale;
  final String address;

  Company(
      {this.id,
      this.shortName,
      this.logo,
      this.financingTag,
      this.area,
      this.industryTag,
      this.welfareTags,
      this.name,
      this.introduction,
      this.companyScaleTag,
      this.companyType,
      this.registerCode,
      this.registerMoney,
      this.registerPerson,
      this.registerTime,
      this.sellScale,
      this.address});

  factory Company.fromJson(Map<String, dynamic> json) {
    List<String> welfares = List();
    if (json['welfareTag'] != null) {
      welfares = json['welfareTag'].toString().split(",");
    }
    return Company(
        id: json['id'] ?? "暂无",
        shortName: json['shortName'] ?? "暂无",
        logo: json['logo'] ?? "暂无",
        financingTag: json['financingTag'] ?? "暂无",
        area: json['area'] ?? "暂无",
        industryTag: json['industryTag'] ?? "暂无",
        welfareTags: welfares ?? List(),
        name: json['name'] ?? "暂无",
        introduction: json['introduction'] ?? "暂无",
        companyScaleTag: json['companyScaleTag'] ?? "暂无",
        companyType: json['companyType'] ?? "暂无",
        registerCode: json['registerCode'] ?? "暂无",
        registerMoney: json['registerMoney'] ?? "暂无",
        registerPerson: json['registerPerson'] ?? "暂无",
        registerTime: json['registerTime'] ?? "暂无",
        sellScale: json['sellScale'] ?? "暂无",
        address: json['address'] ?? "暂无"
    );
  }
}