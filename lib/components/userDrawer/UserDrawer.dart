import 'package:flutter/material.dart';
import 'package:score_analyse/pages/login/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDrawer extends StatefulWidget {
  @override
  _UserDrawerState createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
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
    return this._userName == null || this._userName == "" ? UserLogin() :
    UserInformation(this._userPicture, this._userName, this._identify);
  }
}

// 登录后的侧滑栏
class UserInformation extends StatelessWidget {
  String _userPicture;
  String _userName;
  String _identify;

  UserInformation(this._userPicture, this._userName, this._identify);

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
                  accountEmail: Row(
                    children: [
                      Icon(
                        Icons.camera,
                        color: Colors.cyan
                      ),
                      SizedBox(width: 5),
                      Text(
                        "老师认证",
                        style: TextStyle(
                          color: Colors.cyan
                        ),
                      )
                    ],
                  ),
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
          GestureDetector(
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                backgroundColor: Colors.blue,
              ),
              title: Text("我的喜爱"),
            ),
            onTap: () {
              print("更多功能开发中");
            }
          ),
          GestureDetector(
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.class_,
                  color: Colors.white,
                ),
                backgroundColor: Colors.blue,
              ),
              title: Text("我的收藏"),
            ),
            onTap: () {
              print("更多功能开发中");
            },
          ),
          GestureDetector(
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.people,
                  color: Colors.white,
                ),
                backgroundColor: Colors.blue,
              ),
              title: Text("我的联系人"),
            ),
            onTap: () {
              print("更多功能开发中");
            },
          )
        ],
      ),
    );
  }
}

// 未登录的侧滑栏
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