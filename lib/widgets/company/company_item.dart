import 'package:flutter/material.dart';
import 'package:DearOffer/model/company.dart';
import 'package:DearOffer/pages/company/company_page.dart';

class CompanyItem extends StatelessWidget {
  final Company company;

  const CompanyItem({Key key, this.company}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5),
        child: GestureDetector(
          onTap: (){
            Navigator.push<String>(
              context,
              new MaterialPageRoute(
                builder: (BuildContext context) {
                  return new CompanyPage(company: company);
                },
              ),
            );
          },
          child: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(company.logo),
                          radius: 25,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                company.name,
                                style: TextStyle(fontSize: 15),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "${company.companyScaleTag} | ${company.financingTag} | ${company.industryTag}",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black45),
                              )
                            ],
                          ),
                          flex: 5,
                        )
                      ],
                    )
                  ],
                ),
              )),
        ));
  }
}
