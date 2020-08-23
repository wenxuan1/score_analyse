import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:score_analyse/pages/login/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _userPicture;
  String _userName;
  String _identify;
  // 查看用户是否登录
  void _getUser() async {
//    Response response;
//    Dio dio = new Dio();
//    response = await dio.get("后端接口");
//    print(int.parse(response.toString()));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      this._userPicture = prefs.getString("userpicture");
      this._userName = prefs.getString("username");
      this._identify = prefs.getString("identify");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return this._userName == null || this._userName == "" ? PleaseLogin() :
    ProfileInformation(_userPicture, _userName, _identify);
  }
}

// 未登录我的页面
class PleaseLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 顶部导航
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text(
            "我的",
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.camera,
                size: 100,
                color: Colors.lightBlueAccent,
              ),
              SizedBox(height: 20),
              Text(
                "登录后查看“我的”页面",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900
                )
              ),
              SizedBox(height: 10),
              RaisedButton(
                child: Text(
                  "登录",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                  ),
                ),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Login()
                    )
                  );
                }
              )
            ],
          ),
        )
    );
  }
}

// 登录状态的我的页面
class ProfileInformation extends StatefulWidget {
  String userPicture;
  String userName;
  String identify;

  ProfileInformation(this.userPicture, this.userName, this.identify);

  @override
  _ProfileInformationState createState() => _ProfileInformationState();
}

class _ProfileInformationState extends State<ProfileInformation> {

  void _exit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.clear();
    });
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => Login()),
      (route) => false
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderUserInformation(widget.userPicture, widget.userName, widget.identify), // 用户信息展示
          UserOperation(_exit) // 我的用户操作界面
        ],
      ),
    );
  }
}

// 用户信息展示
class HeaderUserInformation extends StatefulWidget {
  final String _userName;
  final String _userPicture;
  final String _identify;

  HeaderUserInformation(this._userPicture, this._userName, this._identify);

  @override
  _HeaderUserInformationState createState() => _HeaderUserInformationState();
}

class _HeaderUserInformationState extends State<HeaderUserInformation> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 260,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3452117213,870150637&fm=26&gp=0.jpg")
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 85,
                width: 85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  image: DecorationImage(
                      image: NetworkImage(widget._userPicture)
                  )
                )
              ),
              SizedBox(height: 5),
              Text(
                widget._userName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25
                ),
              ),
              SizedBox(height: 10),
              widget._identify == "teacher" ?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera,
                    color: Colors.blue
                  ),
                  SizedBox(width: 5),
                  Text(
                    "老师认证",
                    style: TextStyle(
                        color: Colors.blue
                    ),
                  )
                ],
              ) : SizedBox()
            ],
          ),
        )
    );
  }
}

// 我的用户操作界面
class UserOperation extends StatefulWidget {
  final exit;
  UserOperation(this.exit);

  @override
  _UserOperationState createState() => _UserOperationState();
}

class _UserOperationState extends State<UserOperation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
          children: [
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                child: CircleAvatar(
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 25,
                  ),
                  backgroundColor: Colors.blue,
                ),
              ),
              title: Text(
                "我的喜爱",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                print("更多功能开发中");
              },
            ),
            Divider(),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                child: CircleAvatar(
                  child: Icon(
                    Icons.class_,
                    color: Colors.white,
                    size: 25,
                  ),
                  backgroundColor: Colors.blue,
                ),
              ),
              title: Text(
                "我的收藏",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                print("更多功能开发中");
              },
            ),
            Divider(),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                child: CircleAvatar(
                  child: Icon(
                    Icons.people,
                    color: Colors.white,
                    size: 25,
                  ),
                  backgroundColor: Colors.blue,
                ),
              ),
              title: Text(
                "我的联系人",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                print("更多功能开发中");
              },
            ),
            Divider(),
            RaisedButton(
                child: Text(
                  "退出登录",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                  ),
                ),
                color: Colors.red,
                textColor: Colors.white,
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                ),
                onPressed: () {
                  widget.exit();
                }
            )
          ],
        )
    );
  }
}
