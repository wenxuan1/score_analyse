import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:score_analyse/components/userDrawer/UserDrawer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 侧边栏
      drawer: Drawer(
        child: UserDrawer()
      ),
      // 顶部导航
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          "主页",
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
        child: ListView(
          children: [
            Card(
              margin: EdgeInsets.fromLTRB(3, 6, 3, 3),
              color: Colors.white70,
              child: ListTile(
                title: Text("时间"),
                subtitle: Text("班级"),
              ),
            ),
            Card(
              margin: EdgeInsets.all(3),
              color: Colors.white70,
              child: ListTile(
                title: Text("!!!!!!!"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
