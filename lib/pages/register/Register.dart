import 'package:flutter/material.dart';
import 'package:score_analyse/components/myDialog/MyDialog.dart';
import 'package:score_analyse/pages/login/Login.dart';

// 判空函数
bool _isEmpty(context, username, password) {
  if(username.text == "" || username.text == null) {
    showDialog(
      context: context,
      builder: (context) => MyDialog(
        icons: Icon(
          Icons.cancel,
          size: 40,
        ),
        text: "用户名不能为空"
      )
    );
    return true;
  } else if(password.text == "" || password.text == null) {
    showDialog(
      context: context,
      builder: (context) => MyDialog(
        icons: Icon(
          Icons.cancel,
          size: 40,
        ),
        text: "密码不能为空"
      )
    );
    return true;
  } else {
    return false;
  }
}

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _username = new TextEditingController();
  var _password = new TextEditingController();
  int _identify = 1; // 1老师  2学生

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "注册",
          style: TextStyle(
            color: Colors.white,
            fontSize: 27
          ),
        ),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "http://5b0988e595225.cdn.sohucs.com/images/20190201/a37f30cff3194769b42913303dbeb310.jpeg"
                  )
              )
          ),
          child: Container(
            margin: EdgeInsets.all(40),
            child: Column(
              children: [
                // 用户名框
                TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.people),
                    labelText: "用户名",
                    hintText: "请输入要注册的用户名",
                    hintStyle: TextStyle(color: Colors.black26)
                  ),
                  controller: this._username,
                ),
                SizedBox(height: 30),
                // 密码框
                TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: "密码",
                      hintText: "请输入您要设置的密码",
                      hintStyle: TextStyle(color: Colors.black26)
                    ),
                    controller: this._password
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 1, // 1为老师
                      groupValue: this._identify,
                      onChanged: (value) {
                        setState(() {
                          this._identify = value;
                        });
                      }
                    ),
                    Text("我是老师"),
                    SizedBox(width: 50),
                    Radio(
                      value: 2, // 2为学生
                      groupValue: this._identify,
                      onChanged: (value) {
                        setState(() {
                          this._identify = value;
                        });
                      }
                    ),
                    Text("我是学生"),
                  ],
                ),
                GestureDetector(
                  child: Text(
                    "<  已有账号？去登录",
                    textAlign: TextAlign.end,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Login()
                        )
                    );
                  },
                ),
                SizedBox(height: 20),
                // 登录按钮
                Container(
                  width: double.infinity,
                  height: 55,
                  child: RaisedButton(
                      child: Text("注册", style: TextStyle(fontSize: 25)),
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () {
                        _isEmpty(context, this._username,this._password) ?
                        print("失败") :
                        print("开始注册操作");
                      }
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
