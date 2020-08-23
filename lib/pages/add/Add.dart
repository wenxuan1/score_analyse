import 'package:flutter/material.dart';
import 'package:score_analyse/components/myDialog/MyDialog.dart';
import 'package:score_analyse/data/Data.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  // 考试假数据（主页考试数据信息展示）
  List _list = [
    {
      'id': 0,
      'name': "开学考试",
      'time': "2020年 6月13日"
    },
    {
      'id': 1,
      'name': "第一次摸底考试",
      'time': "2020年 7月1日"
    },
    {
      'id': 2,
      'name': "第二次考试",
      'time': "2021年 7月23日"
    },
    {
      'id': 3,
      'name': "第三次考试",
      'time': "2023年 9月23日"
    },
    {
      'id': 4,
      'name': "第四次摸底考试",
      'time': "2020年 7月13日"
    },
    {
      'id': 5,
      'name': "第五次期中考试",
      'time': "2021年 1月23日"
    },
    {
      'id': 6,
      'name': "第六次期中考试",
      'time': "2021年 9月23日"
    },
    {
      'id': 7,
      'name': "第七次摸底考试",
      'time': "2021年 7月1日"
    },
    {
      'id': 8,
      'name': "期末考试",
      'time': "2021年 7月23日"
    },
    {
      'id': 9,
      'name': "第一百次考试",
      'time': "2023年 9月23日"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 顶部导航
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          "加入或新增",
          style: TextStyle(
              fontSize: 30
          ),
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
      ),
      body: AddNewScore(list: _list)
    );
  }
}

class AddNewScore extends StatefulWidget {
  List list;

  AddNewScore({Key key, this.list}): super(key: key);

  @override
  _AddNewScoreState createState() => _AddNewScoreState();
}

class _AddNewScoreState extends State<AddNewScore> {
  GlobalKey<FormState> _scoreKey = GlobalKey<FormState>(); // 表单校准用的key
  var _name = TextEditingController();
  var _time = TextEditingController();

  void _goAdd(name, time) async {
    String _examName = name;
    String _examTime = time;

    eventBus.fire(ScoreList(widget.list));
    await widget.list.add({
      'id': widget.list.length,
      'name': _examName,
      'time': _examTime
    });
    showDialog(
      context: context,
      builder: (context) => MyDialog(
        icons: Icon(
          Icons.check_circle,
          size: 40,
          color: Colors.greenAccent,
        ),
        text: "新增成功"
      )
    );
  }

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
                  controller: this._name,
                  decoration: InputDecoration(
                    labelText: "考试名称",
                    hintText: "输入考试的名称"
                  ),
                  validator: (value) {
                    return value.trim().length > 0 ? null : "不能为空";
                  }
                ),
                TextFormField(
                  controller: this._time,
                  decoration: InputDecoration(
                    labelText: "考试时间或备注",
                    hintText: "输入考试的时间或备注"
                  ),
                  validator: (value) {
                    return value.trim().length > 0 ? null : "不能为空";
                  }
                ),
                Container(
                  width: 100,
                  padding: EdgeInsets.all(30),
                  child: RaisedButton(
                    child: Text(
                      "新增成绩单",
                      style: TextStyle(fontSize: 20)
                    ),
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      var key = _scoreKey.currentState;
                      if (key.validate()) {
                        key.save();
                        _goAdd(this._name.text, this._time.text);
                        this._name.text = "";
                        this._time.text = "";
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

