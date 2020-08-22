import 'package:flutter/material.dart';
import 'package:score_analyse/pages/grade/Grade.dart';

class HomeCard extends StatefulWidget {
  String examName;
  String examTime;
  int examId;

  HomeCard({Key key, this.examName, this.examTime, this.examId}) : super(key: key);

  @override
  _HomeCardState createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        margin: EdgeInsets.fromLTRB(3, 6, 3, 3),
        color: Colors.white70,
        child: ListTile(
          leading: Icon(
            Icons.camera,
            color: Colors.blue,
          ),
          title: Text(
            widget.examName,
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),
          ),
          subtitle: Text(widget.examTime),
          trailing: Icon(Icons.chevron_right),
        ),
      ),
      onTap: () {
        print(widget.examId);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Grade(examId: widget.examId)
          )
        );
      },
    );
  }
}

