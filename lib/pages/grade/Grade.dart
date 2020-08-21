import 'package:flutter/material.dart';

class Grade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "成绩表单",
            style: TextStyle(
                color: Colors.white,
                fontSize: 27
            ),
          ),
        ),
      ),
      body: Center(
        child: Text("!!!!!!成绩单!!!!!!!"),
      ),
    );
  }
}