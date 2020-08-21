import 'package:flutter/material.dart';
import 'package:score_analyse/pages/login/Login.dart';

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

class UserDrawer extends StatefulWidget {
  @override
  _UserDrawerState createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  int _userId = 1;

  @override
  Widget build(BuildContext context) {
//    return _userId == null ? UserLogin() : UserInformation();
  return UserLogin();
  }
}

class UserInformation extends StatelessWidget {
  final String _userPicture = "https://img03.sogoucdn.com/app/a/100520093/fb41c7c77a2454f7-01eba5833e7e38bc-11cc0200d4b834a0dddb28091fd46806.jpg";
  final String _userName = "文轩。";
  final String _userEmail = "1404196630@qq.com";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFE3F2FD),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: UserAccountsDrawerHeader(
                  currentAccountPicture: InkWell(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(_userPicture),
                    ),
                    onTap: (){
                      print("点击了用户的头像！！！");
                    },
                  ),
                  accountName: Text(
                      _userName,
                      style: TextStyle(fontSize: 23)
                  ),
                  accountEmail: Text(_userEmail),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://i02piccdn.sogoucdn.com/d84a2b902855e6f0")
                      )
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              backgroundColor: Colors.red,
            ),
            title: Text("我的喜爱"),
          )
        ],
      ),
    );
  }
}

class UserLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFE3F2FD),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("您还未登录，请先登录"),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: 100,
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Text("登录",style: TextStyle(fontSize: 23)),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Login()
                    )
                  );
                }
              ),
            ),
          ],
        )
      ),
    );
  }
}

