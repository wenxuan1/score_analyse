import 'package:flutter/material.dart';
import 'package:score_analyse/components/myDialog/MyDialog.dart';
import 'package:score_analyse/pages/register/Register.dart';

// 判空函数
bool _isEmpty(context, username, password) {
  if (username.text == "" || username.text == null) {
    showDialog(
      context: context,
      builder: (context) => MyDialog(
        icons: Icon(
          Icons.cancel,
          size: 40,
        ),
        text: "用户名不能为空"));
    return true;
  } else if (password.text == "" || password.text == null) {
    showDialog(
      context: context,
      builder: (context) => MyDialog(
        icons: Icon(
          Icons.cancel,
          size: 40,
        ),
        text: "密码不能为空"));
    return true;
  } else {
    return false;
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _username = new TextEditingController();
  var _password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "登录",
          style: TextStyle(color: Colors.white, fontSize: 27),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              "http://5b0988e595225.cdn.sohucs.com/images/20190201/a37f30cff3194769b42913303dbeb310.jpeg"))),
          child: Container(
            margin: EdgeInsets.all(40),
            child: Column(
              children: [
                // 用户名框
                TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.people),
                    labelText: "用户名",
                    hintText: "请输入用户名",
                    hintStyle: TextStyle(color: Colors.black26)),
                  controller: this._username,
                ),
                SizedBox(height: 30),
                // 密码框
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: "密码",
                    hintText: "请输入密码",
                    hintStyle: TextStyle(color: Colors.black26)),
                  controller: this._password),
                SizedBox(height: 20),
                GestureDetector(
                  child: Text(
                    "还没有账号？去注册 >",
                    textAlign: TextAlign.end,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Register()));
                  },
                ),
                SizedBox(height: 20),
                // 登录按钮
                Container(
                  width: double.infinity,
                  height: 55,
                  child: RaisedButton(
                    child: Text("登录", style: TextStyle(fontSize: 25)),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      _isEmpty(context, this._username,this._password) ?
                      print("失败") :
                      print("开始登陆操作");
                    }),
                )
              ],
            ),
          )),
    );
  }
}

//class llogin extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return ListView(
//      scrollDirection: Axis.horizontal,
//      children: [
//        ClipOval(
//          child: Container(
//            width: 50,
//            height: 50,
//            color: Colors.blue,
//            child: Icon(
//              Icons.people,
//              color: Colors.white,
//            ),
//          ),
//        ),
//        ClipOval(
//          child: Container(
//            width: 50,
//            height: 50,
//            color: Colors.blue,
//            child: Icon(
//              Icons.people,
//              color: Colors.white,
//            ),
//          ),
//        )
//      ],
//    );
//  }
//}
