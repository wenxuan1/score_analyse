import 'package:flutter/material.dart';

class Add extends StatelessWidget {
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