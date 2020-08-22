import 'package:flutter/material.dart';

// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// 录入成绩时  exam的id直接就是list列表的lenth长度

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
      body: Center(
        child: Text("!!!!!!新增!!!!!!!"),
      ),
    );
  }
}
