import 'package:DearOffer/model/comment.dart';
import 'package:DearOffer/model/company.dart';
import 'package:DearOffer/model/interview.dart';
import 'package:DearOffer/model/position.dart';
import 'package:DearOffer/model/salary.dart';
import 'package:DearOffer/model/teachIn.dart';

// 公司列表
List<Company> companiesMock = [
  Company(
      id: "123",
      shortName: "中国平安",
      logo:
          "https://img.bosszhipin.com/beijin/upload/tmp/20190430/e0d32f7fedffeb72e134d4099472baa6a06ba4e6c382290dd42358eb4817e9fb.png?x-oss-process=image/resize,w_120,limit_0",
      financingTag: "已上市",
      area: "上海",
      industryTag: "金融",
      welfareTags: ["六险一金", "美女如云", "加班补贴", "多套工服", "带薪休假"],
      name: "中国平安科技责任有限公司",
      introduction: "平安综合金融是平安集团旗下20多家的子公司之一，公司发展迅速，资金背景雄厚，信贷行业的黄埔军校。",
      companyScaleTag: "10000人以上",
      companyType: "国有控股",
      registerCode: "ASD123941S55421LO",
      registerMoney: "500000.0万亿人民币",
      registerPerson: "JavaKK",
      registerTime: "1999-03-01",
      sellScale: "金融|保险等",
      address: "上海黄浦军校附3203-99号"),
  Company(
      id: "123",
      shortName: "中国平安",
      logo:
          "https://img.bosszhipin.com/beijin/upload/tmp/20190430/e0d32f7fedffeb72e134d4099472baa6a06ba4e6c382290dd42358eb4817e9fb.png?x-oss-process=image/resize,w_120,limit_0",
      financingTag: "已上市",
      area: "上海",
      industryTag: "金融",
      welfareTags: ["六险一金", "美女如云", "加班补贴", "多套工服", "带薪休假"],
      name: "中国平安科技责任有限公司",
      introduction: "平安综合金融是平安集团旗下20多家的子公司之一，公司发展迅速，资金背景雄厚，信贷行业的黄埔军校。",
      companyScaleTag: "10000人以上",
      companyType: "国有控股",
      registerCode: "ASD123941S55421LO",
      registerMoney: "500000.0万亿人民币",
      registerPerson: "JavaKK",
      registerTime: "1999-03-01",
      sellScale: "金融|保险等",
      address: "上海黄浦军校附3203-99号"),
  Company(
      id: "123",
      shortName: "中国平安",
      logo:
          "https://img.bosszhipin.com/beijin/upload/tmp/20190430/e0d32f7fedffeb72e134d4099472baa6a06ba4e6c382290dd42358eb4817e9fb.png?x-oss-process=image/resize,w_120,limit_0",
      financingTag: "已上市",
      area: "上海",
      industryTag: "金融",
      welfareTags: ["六险一金", "美女如云", "加班补贴", "多套工服", "带薪休假"],
      name: "中国平安科技责任有限公司",
      introduction: "平安综合金融是平安集团旗下20多家的子公司之一，公司发展迅速，资金背景雄厚，信贷行业的黄埔军校。",
      companyScaleTag: "10000人以上",
      companyType: "国有控股",
      registerCode: "ASD123941S55421LO",
      registerMoney: "500000.0万亿人民币",
      registerPerson: "JavaKK",
      registerTime: "1999-03-01",
      sellScale: "金融|保险等",
      address: "上海黄浦军校附3203-99号"),
];

List<Comment> commentsMock = [
  Comment(
      id: "1",
      score: 5,
      commentTag: ["垃圾公司", "千万别去", "没得意思"],
      likedCount: 65,
      companyId: "12365",
      content: "海康威视体制僵化，不适合年轻人，意义不大",
      publisherName: "JavaKK",
      publisherHead:
          "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2110374320,3065268547&fm=27&gp=0.jpg",
      createTime: "一天前",
      pageView: 10,
      companyName: "海康威视"),
  Comment(
      id: "2",
      score: 5,
      commentTag: ["垃圾公司", "千万别去", "没得意思"],
      likedCount: 65,
      companyId: "12365",
      content: "海康威视体制僵化，不适合年轻人，意义不大",
      publisherName: "JavaKK",
      publisherHead:
          "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2110374320,3065268547&fm=27&gp=0.jpg",
      createTime: "一天前",
      pageView: 10,
      companyName: "海康威视"),
];

// 职位信息
List<Position> positionsMock = [
  Position(
      id: "1",
      publisherId: "1",
      positionTag: "实习生",
      cityTag: ["成都", "上海", "北京"],
      experienceTag: "无",
      degreeTag: ["本科", "研究生", "博士"],
      salaryLow: "5",
      salaryHigh: "15",
      skillTag: ["Java", "Mysql", "MongoDB", "Redis", "Nosql"],
      description: "此属性很少设置，用于选择区域特定字形的语言环境",
      attachment: "www.baidu.com",
      total: 5,
      applyStart: "2019-01-01",
      companyId: "1",
      title: "Java实习生Java实习生Java实习生Java实习生",
      applyEnd: "2019-05-01",
      interviewStart: "2019-01-11",
      interviewEnd: "2019-01-19",
      logo:
          "https://img.bosszhipin.com/beijin/upload/tmp/20190430/e0d32f7fedffeb72e134d4099472baa6a06ba4e6c382290dd42358eb4817e9fb.png?x-oss-process=image/resize,w_120,limit_0",
      companyScale: "1000人以上",
      financingTag: "A轮",
      salary: "5-8K"),
  Position(
      id: "3",
      publisherId: "1",
      positionTag: "实习生",
      cityTag: ["成都", "上海", "北京"],
      experienceTag: "无",
      degreeTag: ["本科", "研究生", "博士"],
      salaryLow: "5",
      salaryHigh: "15",
      skillTag: ["Java", "Mysql", "MongoDB", "Redis", "Nosql"],
      description: "此属性很少设置，用于选择区域特定字形的语言环境",
      attachment: "www.baidu.com",
      total: 5,
      applyStart: "2019-01-01",
      companyId: "1",
      title: "Java实习生",
      applyEnd: "2019-05-01",
      interviewStart: "2019-01-11",
      interviewEnd: "2019-01-19",
      logo:
          "https://img.bosszhipin.com/beijin/upload/tmp/20190430/e0d32f7fedffeb72e134d4099472baa6a06ba4e6c382290dd42358eb4817e9fb.png?x-oss-process=image/resize,w_120,limit_0",
      companyScale: "1000人以上",
      financingTag: "A轮"),
  Position(
      id: "2",
      publisherId: "1",
      positionTag: "实习生",
      cityTag: ["成都", "上海", "北京"],
      experienceTag: "无",
      degreeTag: ["本科", "研究生", "博士"],
      salaryLow: "5",
      salaryHigh: "15",
      skillTag: ["Java", "Mysql", "MongoDB", "Redis", "Nosql"],
      description: "此属性很少设置，用于选择区域特定字形的语言环境",
      attachment: "www.baidu.com",
      total: 5,
      applyStart: "2019-01-01",
      companyId: "1",
      title: "Java实习生",
      applyEnd: "2019-05-01",
      interviewStart: "2019-01-11",
      interviewEnd: "2019-01-19",
      logo:
          "https://img.bosszhipin.com/beijin/upload/tmp/20190430/e0d32f7fedffeb72e134d4099472baa6a06ba4e6c382290dd42358eb4817e9fb.png?x-oss-process=image/resize,w_120,limit_0",
      companyScale: "1000人以上",
      financingTag: "A轮")
];

List<Interview> interviewsMock = [
  Interview(
      id: "ASD",
      likeCount: 123,
      pageView: 12,
      score: 3,
      content: "这是点评内容",
      title: "我是标题",
      publisherName: "发布者",
      publisherHead:
          "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1433091807,3445613977&fm=27&gp=0.jpg",
      experienceTag: "还不错,体验好,面试官好",
      companyName: "阿里巴巴科技",
      createTime: "19分钟前"),
  Interview(
      id: "ASD",
      likeCount: 123,
      pageView: 12,
      score: 3,
      content: "这是点评内容",
      title: "我是标题",
      publisherName: "发布者",
      publisherHead:
          "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1433091807,3445613977&fm=27&gp=0.jpg",
      experienceTag: "还不错,体验好,面试官好",
      companyName: "阿里巴巴科技",
      createTime: "19分钟前"),
  Interview(
      id: "ASD",
      likeCount: 123,
      pageView: 12,
      score: 3,
      content: "这是点评内容",
      title: "我是标题",
      publisherName: "发布者",
      publisherHead:
          "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1433091807,3445613977&fm=27&gp=0.jpg",
      experienceTag: "还不错,体验好,面试官好",
      companyName: "阿里巴巴科技",
      createTime: "19分钟前"),
  Interview(
      id: "ASD",
      likeCount: 123,
      pageView: 12,
      score: 3,
      content: "这是点评内容",
      title: "我是标题",
      publisherName: "发布者",
      publisherHead:
          "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1433091807,3445613977&fm=27&gp=0.jpg",
      experienceTag: "还不错,体验好,面试官好",
      companyName: "阿里巴巴科技",
      createTime: "19分钟前")
];

List<Salary> salariesMock = [
  Salary(
      id: '1',
      companyId: '1',
      companyName: '中国移动',
      salary: '2000+4510',
      city: '成都',
      positionTitle: 'Java开发',
      detail: '有点坑',
      degreeTag: '本科',
      credibility: 5),
  Salary(
      id: '1',
      companyId: '1',
      companyName: '中国移动',
      salary: '2000+4510',
      city: '成都',
      positionTitle: 'Java开发',
      detail: '有点坑',
      degreeTag: '本科',
      credibility: 5),
  Salary(
      id: '1',
      companyId: '1',
      companyName: '中国移动',
      salary: '2000+4510',
      city: '成都',
      positionTitle: 'Java开发',
      detail: '有点坑',
      degreeTag: '本科',
      credibility: 5),
];

List<TeachIn> teachInMock = [
  TeachIn(
      id: '12',
      companyName: '海康威视',
      schoolName: '成都理工大学',
      content: '送达',
      address: '芙蓉2楼',
      startTime: '2018-9-9'
  ),
  TeachIn(
      id: '12',
      companyName: '海康威视',
      schoolName: '成都理工大学',
      content: '送达',
      address: '芙蓉2楼',
      startTime: '2018-9-9'
  ),
];
