import 'package:DearOffer/common/config/config.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:card_settings/card_settings.dart';

class AddSalaryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddSalaryPage();
  }
}

class FormSalary {
  String companyName = "";
  String positionTitle = "";
  String degreeTag = "";
  String bonus = "";
  String city = "";
  String detail = "";
}

class _AddSalaryPage extends State<AddSalaryPage> {
  FormSalary formSalary = FormSalary();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _autoValidate = false;

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        child: CardSettings(
          children: <Widget>[
            CardSettingsHeader(label: '薪 资 报 料'),
            CardSettingsText(
              label: '所在公司',
              initialValue: formSalary.companyName,
              autovalidate: _autoValidate,
              hintText: "输入公司名称",
              onChanged: (value) {
                setState(() {
                  formSalary.companyName = value;
                });
              },
            ),
            CardSettingsText(
              label: '职位名称',
              hintText: "输入职位名称",
              initialValue: formSalary.positionTitle,
              onChanged: (value) {
                setState(() {
                  formSalary.positionTitle = value;
                });
              },
            ),
            CardSettingsListPicker(
              label: '学历层次',
              hintText: "选择学历",
              options: ["专科", "本科", "硕士", "博士"],
              initialValue: formSalary.degreeTag,
              validator: (value) {
                if (value == null && value.isEmpty) return ' ';
              },
              onChanged: (value) {
                setState(() {
                  formSalary.degreeTag = value;
                });
              },
            ),
            CardSettingsText(
                label: '薪资情况',
                hintText: '介绍薪资情况',
                initialValue: formSalary.bonus,
                onSaved: (value) => formSalary.bonus = value,
                onChanged: (value) {
                  setState(() {
                    formSalary.bonus = value;
                  });
                }),
            InkWell(
                onTap: () {
                  showCity(context);
                },
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 14, top: 10),
                      child: Text("所在城市", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),),
                    ), 
                    Padding(
                      padding: EdgeInsets.only(left: 90, top: 8),
                      child: Text(formSalary.city, maxLines: 1, overflow: TextOverflow.ellipsis,),
                    )
                  ],
                )
            ),
            CardSettingsParagraph (
              label: '其他说明',
              initialValue: formSalary.detail,
              onChanged: (value) {
                setState(() {
                  formSalary.detail = value;
                });
              },
            ),
            CardSettingsButton(
              label: "发布",
              backgroundColor: Color(0xff66ccff),
              onPressed: _savePressed,
            ),
            CardSettingsButton(
              label: "取消",
              backgroundColor: Colors.grey,
              onPressed: _resetPressed,
            ),
          ],
        ),
      ),
    );
  }

  Future _savePressed() async {
    if (formSalary.companyName.length == 0) {
      showInSnackBar("公司名称未输入");
    } else if (formSalary.positionTitle.length == 0) {
      showInSnackBar("职位名称未输入");
    } else if (formSalary.degreeTag.length == 0) {
      showInSnackBar("学历未选择");
    } else if (formSalary.bonus.length == 0) {
      showInSnackBar("薪资情况未输入");
    } else if (formSalary.city.length == 0) {
      showInSnackBar("城市未选中");
    } else {
      //
      Response response = await Dio().post(Config.SALARY_URL, data: {
        "companyName": formSalary.companyName,
        "positionTitle": formSalary.positionTitle,
        "degreeTag": formSalary.degreeTag,
        "bonus": formSalary.bonus,
        "city": formSalary.city,
      });

      if (response.data["code"] == 1000) {
        showInSnackBar("报料成功");
      } else {
        showInSnackBar(response.data["message"]);
      }
    }
  }

  void _resetPressed() {
    _formKey.currentState.reset();
    Navigator.pop(context);
  }

  void showInSnackBar(String value) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "WorkSansSemiBold"),
      ),
      backgroundColor: Color(0xFF66ccff),
      duration: Duration(seconds: 2),
    ));
  }

  showCity(context) async {
    Result temp = await CityPickers.showCityPicker(
      showType: ShowType.pc,
      context: context,
      // locationCode: '640221',
      height: 400,
    );

    setState(() {
      formSalary.city = "${temp.provinceName} - ${temp.cityName}";
    });
  }
}
