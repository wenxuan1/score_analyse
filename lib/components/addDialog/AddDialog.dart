import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:score_analyse/components/myDialog/MyDialog.dart';

class AddDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            title: Text(
              "添加学生成绩",
              style: TextStyle(fontSize: 20),
            ),
            centerTitle: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF42A5F5),
                    Color(0xFF3D5AFE),
                    Color(0xFF0018EB),
                  ]
                ),
              ),
            ),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  Navigator.of(context).pop();
                }
              )
            ],
          ),
          body: ScoreForm()
        ),
      )
    );
  }
}

class ScoreForm extends StatefulWidget {
  @override
  _ScoreFormState createState() => _ScoreFormState();
}

class _ScoreFormState extends State<ScoreForm> {
  GlobalKey<FormState> _scoreKey = GlobalKey<FormState>(); // 表单校准用的key
  String _studentName;
  int _china, _math, _english, _physics, _chemistry, _biology;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Form(
        key: _scoreKey,
        autovalidate: false,
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "学生姓名",
                hintText: "输入学生的姓名"
              ),
              validator: (value) {
                return value.trim().length > 0 && value != null ? null : "学生姓名不能为空";
              },
              onChanged: (val) {
                this._studentName = val.toString();
              }
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "语文",
                hintText: "输入学生语文成绩"
              ),
              validator: (value) {
                return value.trim().length > 0 ? null : "成绩输入有误";
              },
              onChanged: (val) {
                this._china = int.parse(val);
              }
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "数学",
                hintText: "输入学生的数学成绩"
              ),
              validator: (value) {
                return value.trim().length > 0 ? null : "成绩不能为空";
              },
              onChanged: (val) {
                this._math = int.parse(val);
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "英语",
                hintText: "输入学生英语成绩"
              ),
              validator: (value) {
                return value.trim().length > 0 ? null : "成绩不能为空";
              },
              onChanged: (val) {
                this._english = int.parse(val);
              }
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "物理",
                hintText: "输入学生物理成绩"
              ),
              validator: (value) {
                return value.trim().length > 0 ? null : "成绩不能为空";
              },
              onChanged: (val) {
                this._physics = int.parse(val);
                }
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "化学",
                hintText: "输入学生化学成绩"
              ),
              validator: (value) {
                return value.trim().length > 0 ? null : "成绩不能为空";
              },
              onChanged: (val) {
                this._chemistry = int.parse(val);
              }
            ),
            TextFormField(
                decoration: InputDecoration(
                  labelText: "生物",
                  hintText: "输入学生生物成绩"
                ),
                validator: (value) {
                  return value.trim().length > 0 ? null : "成绩不能为空";
                },
                onChanged: (val) {
                  this._biology = int.parse(val);
                }
            ),
            Container(
              width: 100,
              padding: EdgeInsets.all(30),
              child: RaisedButton(
                child: Text(
                    "录入成绩",
                    style: TextStyle(fontSize: 20)
                ),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  var key = _scoreKey.currentState;
                  List list = [_studentName, _china, _math, _english, _physics, _chemistry, _biology,
                    _china+_math+_english+_physics+_chemistry+_biology
                  ];
                  if (key.validate()) {
                    key.save();
                    showDialog(
                      context: context,
                      builder: (context) => MyDialog(
                        icons: Icon(
                          Icons.check_circle,
                          size: 40,
                          color: Colors.greenAccent,
                        ),
                        text: "录入成功"
                      )
                    );
                    const timeout = const Duration(milliseconds: 2100);
                    Timer(timeout,
                      () => Navigator.of(context).pop(list)
                    );
                  }
                }
              )
            )
          ]
        )
      ),
    );
  }
}

