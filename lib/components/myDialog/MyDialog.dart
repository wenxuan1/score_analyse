import 'dart:async';

import 'package:flutter/material.dart';

class MyDialog extends Dialog {
  Widget icons;
  String text;
  MyDialog({this.icons, this.text});

  // 定时器
  _showTimer(context) {
    var timer;
    timer = Timer.periodic(
        Duration(milliseconds: 2000),
        (timer) {
          Navigator.pop(context);
          timer.cancel();
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    _showTimer(context);

    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [
              SizedBox(height: 15),
              this.icons,
              SizedBox(height: 10),
              Text(
                this.text,
                style: TextStyle(
                  fontSize: 15
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
