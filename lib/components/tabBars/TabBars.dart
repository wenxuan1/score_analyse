import 'package:flutter/material.dart';
import 'package:score_analyse/components/FloatingButton/FloatingButton.dart';
import 'package:score_analyse/pages/add/Add.dart';
import 'package:score_analyse/pages/home/Home.dart';
import 'package:score_analyse/pages/profile/Profile.dart';

class TabBars extends StatefulWidget {
  @override
  _TabBarsState createState() => _TabBarsState();
}

class _TabBarsState extends State<TabBars> {
  int _currentIndex = 0; // 当前选中的底部导航栏

  List _pageList = [
    Home(),
    Add(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 录入新增凸起按钮
      floatingActionButton: FloatingButton(
        index: this._currentIndex,
        changeIndex: (i) {
          setState(() {
            this._currentIndex = i;
          });
        }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: this._currentIndex,
          onTap: (int index) {
            setState(() {
              this._currentIndex = index;
            });
          },
          iconSize: 30,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 19,
          unselectedFontSize: 17,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("主页")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                title: Text("录入新增")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text("我的")
            ),
          ]
      ),
      // 根据底部导航显示的内容
      body: this._pageList[_currentIndex],
    );
  }
}
